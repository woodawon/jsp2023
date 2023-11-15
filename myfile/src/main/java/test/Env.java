package test;

import java.util.Map;
import java.util.Properties;

public class Env {

	public static void main(String[] args) {
		printProps();
		printEnv();
		printEtc();
	}

	private static void printEtc() {
		System.out.println(System.getProperty("user.dir"));
		System.out.println(System.getProperty("sonar.token"));
		System.out.println(System.getenv("SONAR_TOKEN"));
		System.out.println("---");
	}

	private static void printEnv() {
		Map<String, String> map = System.getenv();
		for (Map.Entry<String, String> entry : map.entrySet()) {
			System.out.println(entry.getKey() + ": " + entry.getValue());
		}
	}

	public static void printProps() {
		Properties properties = System.getProperties();
		for (String key : properties.stringPropertyNames()) {
			String value = properties.getProperty(key, "");
			System.out.println(key + ": " + value);
		}
	}

}
