import sbt._

object Dependencies {

  val guice = "com.google.inject" % "guice" % "4.1.0"
  val mysql = "mysql" % "mysql-connector-java" % "5.1.40"
  val typeSafeConfig = "com.typesafe" % "config" % "1.3.1"

  val backendDeps = Seq(guice, mysql, typeSafeConfig)
}