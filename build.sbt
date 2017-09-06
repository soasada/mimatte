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

lazy val backoffice = (project in file("backoffice")).
  enablePlugins(PlayScala).
  settings(commonSettings).
  settings(libraryDependencies ++= backendDeps ++ Seq(jdbc, guice))

lazy val clients = (project in file("clients")).
  enablePlugins(PlayScala).
  settings(commonSettings).
  settings(libraryDependencies ++= backendDeps ++ Seq(jdbc, guice))

lazy val website = (project in file("website")).
  enablePlugins(PlayScala).
  settings(commonSettings).
  settings(libraryDependencies ++= backendDeps ++ Seq(jdbc, guice))