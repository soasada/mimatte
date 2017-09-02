import sbt._

object Dependencies {

  val mysql = "mysql" % "mysql-connector-java" % "5.1.44"
  val playJson = "com.typesafe.play" %% "play-json" % "2.6.3"
  val scalaTest = "org.scalatestplus.play" %% "scalatestplus-play" % "3.1.1" % "test"

  val backendDeps = Seq(mysql, playJson)
}