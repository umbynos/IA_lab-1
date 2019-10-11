import com.xeiam.xchart.*;
import com.xeiam.xchart.StyleManager.ChartType;
import com.xeiam.xchart.StyleManager.LegendPosition;
import libreria.distribution.MultivariateNormalDistribution;
import libreria.filter.*;
import libreria.linear.MatrixUtils;
import libreria.linear.RealMatrix;
import libreria.linear.RealVector;
import libreria.random.RandomGenerator;
import libreria.random.Well19937c;
import libreria.userguide.ExampleUtils;
import libreria.userguide.ExampleUtils.ExampleFrame;
import libreria.util.FastMath;
import libreria.MatrixDeterminant;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;

public class MotoRettilineoUniformeTest {

    public static class MotoRettilineoUniforme {

        private final double[] velocity;
        private final double[] location;

        private final double timeslice;
        private final double measurementNoise;

        private final RandomGenerator rng;

        private final double[][] R;
        private final MultivariateNormalDistribution mnd;

        public  MotoRettilineoUniforme(RealMatrix R, double timeslice, double angle, double initialVelocity, double measurementNoise, int seed) {
            this.timeslice = timeslice;

            final double angleInRadians = FastMath.toRadians(angle);
            this.velocity = new double[] {
                    initialVelocity * FastMath.cos(angleInRadians),
                    initialVelocity * FastMath.sin(angleInRadians)
            };

            this.location = new double[] { 0, 0 };

            this.measurementNoise = measurementNoise;
            this.rng = new Well19937c(seed);

            this.R = R.getData();
            double[] means = {0.0,0.0,0.0,0.0};

            this.mnd = new MultivariateNormalDistribution(rng, means, this.R);

        }

        public double getX() {
            return location[0];
        }

        public double getY() {
            return location[1];
        }

        //public double getMeasuredX() { return location[0] + rng.nextGaussian() * measurementNoise; }

        //public double getMeasuredY() { return location[1] + rng.nextGaussian() * measurementNoise;  }

        // per il calcolo della posizione vengono usati mnd e measurementNoise per sporcare i valori
        public double getMeasuredX() { return location[0] + this.mnd.sample()[0] * measurementNoise; }

        public double getMeasuredY() { return location[1] + this.mnd.sample()[2] * measurementNoise;  }

        public double getXVelocity() { return velocity[0]; }

        public double getYVelocity() {
            return velocity[1];
        }

        public void step() {
            location[0] += velocity[0]*timeslice;
            location[1] += velocity[1]*timeslice;
        }
    }

    public static void motoRettilineoUniformeTest(Chart chart) {

        // time interval for each iteration
        final double dt = 0.1;
        // the number of iterations to run
        final int iterations = 200;
        // measurement noise (m)
        final double measurementNoise = 1;
        // initial velocity
        final double initialVelocity = 100;
        // shooting angle
        final double angle = 15;


        // A = [ 1, dt, 0,  0 ]  =>  x(n+1) = x(n) + vx(n)
        //     [ 0,  1, 0,  0 ]  => vx(n+1) =        vx(n)
        //     [ 0,  0, 1, dt ]  =>  y(n+1) =              y(n) + vy(n)
        //     [ 0,  0, 0,  1 ]  => vy(n+1) =                     vy(n)
        final RealMatrix A = MatrixUtils.createRealMatrix(new double[][] {
                { 1, dt, 0,  0 },
                { 0,  1, 0,  0 },
                { 0,  0, 1, dt },
                { 0,  0, 0,  1 }
        });

        // The control vector
        final RealVector controlVector =
                MatrixUtils.createRealVector(new double[] { 0, 0, 0, 0 } );

        // The control matrix B, see control vector
        final RealMatrix B = MatrixUtils.createRealMatrix(new double[][] {
                { 1, 0, 0, 0 },
                { 0, 1, 0, 0 },
                { 0, 0, 1, 0 },
                { 0, 0, 0, 1 }
        });

        // We only observe the x/y coordinates
        final RealMatrix H = MatrixUtils.createRealMatrix(new double[][] {
                { 1, 0, 0, 0 },
                { 0, 0, 0, 0 },
                { 0, 0, 1, 0 },
                { 0, 0, 0, 0 }
        });


        // POTREBBE ESSERE "variare la P(.) iniziale dello stato"
        // The initial error covariance matrix
        final RealMatrix initialErrorCovariance = MatrixUtils.createRealMatrix(new double[][] {
                {   1,    0,   0,    0 },
                {   0,    0,   0,    0 },
                {   0,    0,   1,    0 },
                {   0,    0,   0,    0 }
        });

        // the measurement covariance matrix
        final RealMatrix R = MatrixUtils.createRealMatrix(new double[][] {
                {    500,    0,     0,    0 },
                {     0,    1,     0,    0 },
                {     0,    0,  500,    0 },
                {     0,    0,     0,    1 }
        });

        // process noise DA VARIARE
        //final RealMatrix Q = MatrixUtils.createRealMatrix(4, 4);
        final RealMatrix Q = MatrixUtils.createRealMatrix(new double[][] {
                { 0.05,    0,   0,    0 },
                { 0,    0,   0,    0 },
                { 0,    0,   0.05,    0 },
                { 0,    0,   0,    0 }
        });

        // the measurement covariance matrix for Kalman Filter FORSE DA MIDIFICARE
        final RealMatrix RK = MatrixUtils.createRealMatrix(new double[][] {
                {    20,    0,     0,    0 },
                {     0,    1,     0,    0 },
                {     0,    0,     20,    0 },
                {     0,    0,     0,    1 }
        });

        // definizione del moto rettilineo uniforme
        final MotoRettilineoUniforme mru = new MotoRettilineoUniforme(R, dt, angle, initialVelocity, measurementNoise, 1000);

        // This is our guess of the initial state.
        final double speedX = mru.getXVelocity();
        final double speedY = mru.getYVelocity();
        final RealVector initialState = MatrixUtils.createRealVector(new double[] { 0, speedX, 150, speedY } );
        // POSX, SPEEDX, POSY, SPEDDY. FAI ESPERIMENTI CAMBIANDO LE POSIZIONI

        // Kalman Filter
        final ProcessModel pm = new DefaultProcessModel(A, B, Q, initialState, initialErrorCovariance);
        final MeasurementModel mm = new DefaultMeasurementModel(H, RK);
        final KalmanFilter filter = new KalmanFilter(pm, mm);

        final List<Number> realX = new ArrayList<Number>();
        final List<Number> realY = new ArrayList<Number>();
        final List<Number> measuredX = new ArrayList<Number>();
        final List<Number> measuredY = new ArrayList<Number>();
        final List<Number> kalmanX = new ArrayList<Number>();
        final List<Number> kalmanY = new ArrayList<Number>();

        final List<Number> erroreX = new ArrayList<Number>();
        final List<Number> erroreY = new ArrayList<Number>();
        final List<Number> kalmanGainX = new ArrayList<Number>();
        final List<Number> kalmanGainY = new ArrayList<Number>();

        for (int i = 0; i < iterations; i++) {

            // get real location
            realX.add(mru.getX());
            realY.add(mru.getY());

            // get measured location
            final double mx = mru.getMeasuredX();
            final double my = mru.getMeasuredY();

            measuredX.add(mx);
            measuredY.add(my);

            // iteration to the next timeslice.
            mru.step();

            final double[] state = filter.getStateEstimation();
            kalmanX.add(state[0]);
            kalmanY.add(state[2]);

            // update the kalman filter with the measurements
            filter.predict(controlVector);
            filter.correct(new double[] { mx, 0, my, 0 } );


            erroreX.add(i);
            double[][] error = filter.getErrorCovariance();
            erroreY.add(error[0][0]);
            //erroreY.add(error[2][2]);

            kalmanGainX.add(i);
            RealMatrix kalmanGain = filter.getKalmanGain();
            kalmanGainY.add(kalmanGain.getData()[0][0]);
            //kalmanGainY.add(kalmanGain.getData()[2][2]);

        }

        // STAMPIAMO LA MATRICE DEGLI ERRORI
        System.out.println("Matrice degli errori");
        double[][] error = filter.getErrorCovariance();
        printMatrix(error);
        System.out.println();

        // STAMPA IL DETERMINANTE DELLA MATRICE DEGLI ERRORI
        System.out.println("Determinante della matrice degli errori: " +
                MatrixDeterminant.determinantOfMatrix(error, 4));

        // STAMPIAMO LA MATRICE DI KALMAN GAIN
        System.out.println("Matrice del Kalman gain");
        double[][] kalmanGain = filter.getKalmanGain().getData();
        printMatrix(kalmanGain);
        System.out.println();

        // STAMPA IL DETERMINANTE DELLA MATRICE di Kalman Gain
        System.out.println("Determinante della matrice di Kalman Gain: " +
                MatrixDeterminant.determinantOfMatrix(kalmanGain, 4));

        chart.setXAxisTitle("X");
        chart.setYAxisTitle("Y");

        Series dataset = chart.addSeries("true", realX, realY);
        dataset.setMarker(SeriesMarker.NONE);

        dataset = chart.addSeries("measured", measuredX, measuredY);
        dataset.setLineStyle(SeriesLineStyle.DOT_DOT);
        dataset.setMarker(SeriesMarker.NONE);

        dataset = chart.addSeries("kalman", kalmanX, kalmanY);
        dataset.setLineColor(Color.red);
        dataset.setLineStyle(SeriesLineStyle.DASH_DASH);
        dataset.setMarker(SeriesMarker.NONE);

    }

    public static Chart createChartBis(String title, int width, int height,
                                       LegendPosition position, boolean legendVisible) {
        Chart chart = new ChartBuilder().width(width).height(height).build();

        // Customize Chart
        chart.setChartTitle(title);
        chart.getStyleManager().setChartTitleVisible(true);
        chart.getStyleManager().setChartTitleFont(new Font("Arial", Font.PLAIN, 12));
        chart.getStyleManager().setLegendPosition(position);
        chart.getStyleManager().setLegendVisible(legendVisible);
        chart.getStyleManager().setLegendFont(new Font("Arial", Font.PLAIN, 12));
        chart.getStyleManager().setLegendPadding(6);
        chart.getStyleManager().setLegendSeriesLineLength(10);
        chart.getStyleManager().setAxisTickLabelsFont(new Font("Arial", Font.PLAIN, 10));

        chart.getStyleManager().setChartBackgroundColor(Color.white);
        chart.getStyleManager().setChartPadding(4);

        chart.getStyleManager().setChartType(ChartType.Line);
        return chart;
    }

    public static JComponent createComponent() {
        JComponent container = new JPanel();
        container.setLayout(new BoxLayout(container, BoxLayout.LINE_AXIS));

        Chart chart = createChartBis("Moto Rettilineo Uniforme", 550, 450, LegendPosition.InsideNE, true);
        motoRettilineoUniformeTest(chart);
        container.add(new XChartPanel(chart));

        container.setBorder(BorderFactory.createLineBorder(Color.black, 1));
        return container;
    }

    @SuppressWarnings("serial")
    public static class Display extends ExampleFrame {

        private JComponent container;

        public Display() {
            setTitle("Commons Math: Kalman Filter - Moto Rettilineo Uniforme");
            setSize(1450, 515);

            container = new JPanel();
            JComponent comp = createComponent();
            container.add(comp);

            add(container);
        }

        @Override
        public Component getMainPanel() {
            return container;
        }
    }

    public static void printMatrix(double[][] matrix){
        for(int i=0; i<matrix[0].length; i++){
            for(int j=0; j<matrix.length; j++){
                System.out.print(matrix[i][j] + "\t");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        ExampleUtils.showExampleFrame(new Display());
    }
}
