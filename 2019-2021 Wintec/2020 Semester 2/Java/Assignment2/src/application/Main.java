package application;
	
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.geometry.Pos;
import javafx.stage.Stage;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.text.Font;


public class Main extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {
			StackPane root = new StackPane();
			
			double width = 400, height = 400;
			int radius = 10, speed = 5;
			
			Pane gamePane = new Pane();
			root.getChildren().add(gamePane);
			
			VBox timerBox = new VBox();
			timerBox.setAlignment(Pos.TOP_CENTER);
			root.getChildren().add(timerBox);
			
			VBox targetBox = new VBox();
			targetBox.setAlignment(Pos.BOTTOM_CENTER);
			root.getChildren().add(targetBox);
			
			Label label = new Label("0");
			label.setFont(Font.font(20));
			label.setTextFill(Color.BLUE);
			timerBox.getChildren().add(label);
			
			Circle movingc = new Circle(height/2, width/2, radius);
			movingc.setFill(Color.RED);
			gamePane.getChildren().add(movingc);
			
			int amount = 0;
			int qty = ThreadLocalRandom.current().nextInt(5, 11);
			while(amount < qty) {
			double randomx = ThreadLocalRandom.current().nextDouble(5, width-5);
			double randomy = ThreadLocalRandom.current().nextDouble(5, height-5);
			Circle dot1 = new Circle(randomx, randomy, 5);
			dot1.setFill(Color.BLACK);
			gamePane.getChildren().add(dot1);
			amount++;
			}
			Label targets = new Label("Targets Left: " +String.valueOf(qty));
			targets.setFont(Font.font(20));
			targets.setTextFill(Color.GREEN);
			targetBox.getChildren().add(targets);
			
			
			gamePane.setFocusTraversable(true);
			
			Scene scene = new Scene(root, width, height);
			primaryStage.setScene(scene);
			primaryStage.show();
			
			//Bring gamePane to focus
			gamePane.requestFocus();
			AnimationTimer timer = new AnimationTimer() {
				private long startTime = System.currentTimeMillis();
				@Override public void handle(long stamp) {
					long present = System.currentTimeMillis();
					double elapseTime = (present - startTime)/1000.0;
					label.setText("Elapsed Time: " + String.format("%.2f",(double)elapseTime) + "s");
				}
			};
			timer.start();
			
			gamePane.setOnKeyPressed(e ->{
				double x = movingc.getCenterX();
				double y = movingc.getCenterY();
				
				switch(e.getCode()) {
					case UP:
						if(y > radius)
							movingc.setCenterY(y - speed);
						break;
					case LEFT:
						if(x > radius)
							movingc.setCenterX(x - speed);
						break;
					case DOWN:
						if(y < height - radius)
							movingc.setCenterY(y + speed);
						break;
					case RIGHT:
						if(x < width - radius)
							movingc.setCenterX(x + speed);
						break;
					default:
						break;
				}
				
				List<Node> overlaps = new LinkedList<>();
				ObservableList<Node> allCircles = gamePane.getChildren();
				for(Node n: allCircles) {
					Circle c = (Circle) n;
					if(isOverlap(movingc, c)) {
						overlaps.add(c);	
					}
				}
				for(Node n : overlaps) {
					allCircles.remove(n);
					targets.setText("Targets Left: "  + String.valueOf(allCircles.size()-1));
				}
				if(allCircles.size() == 1) {
					timer.stop();
					movingc.setFill(Color.GREEN);
				}
			});
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean isOverlap(Circle c1, Circle c2) {
		double x1 = c1.getCenterX();
		double y1 = c1.getCenterY();
		double x2 = c2.getCenterX();
		double y2 = c2.getCenterY();
		
		double comp1 = Math.pow(Math.abs(x2 - x1), 2);
		double comp2 = Math.pow(Math.abs(y2 - y1), 2);
		double distance = Math.sqrt(comp1 + comp2);
		double r1 = c1.getRadius();
		double r2 = c2.getRadius();
		boolean cond1 = distance <= r1 + r2;
		boolean cond2 = distance > 0;
		boolean overlap = cond1 && cond2;
		return overlap;
	}
	public static void main(String[] args) {
		launch(args);
	}
}
