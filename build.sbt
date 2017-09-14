import Dependencies._

lazy val commonSettings = Seq(
  name := "mimatte",
  organization := "com.popokis",
  version := "1.0",
  isSnapshot := true,
  scalaVersion := "2.12.3",
  publishArtifact in (Compile, packageDoc) := false,
  publishArtifact in packageDoc := false,
  sources in (Compile,doc) := Seq.empty
)

lazy val root = (project in file(".")).
  enablePlugins(PlayScala).
  settings(commonSettings).
  settings(libraryDependencies ++= backendDeps ++ Seq(jdbc, guice, evolutions))