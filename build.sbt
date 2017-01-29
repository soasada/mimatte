import Dependencies._

lazy val commonSettings = Seq(
  name := "mimatte",
  organization := "popokis",
  version := "1.0",
  isSnapshot := true,
  scalaVersion := "2.11.8"
)

lazy val root = (project in file(".")).
  enablePlugins(PlayScala).
  settings(commonSettings: _*).
  settings(
    libraryDependencies ++= backendDeps ++ Seq(jdbc),
    publishArtifact in (Compile, packageDoc) := false,
    publishArtifact in packageDoc := false,
    sources in (Compile,doc) := Seq.empty
  )