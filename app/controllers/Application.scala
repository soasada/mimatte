package controllers

import play.api.mvc.{Action, Controller}


class Application extends Controller {

  def index = Action {
    Ok(views.html.index())
  }

  def services = Action {
    Ok(views.html.services())
  }

  def about = Action {
    Ok(views.html.about())
  }

  def contact = Action {
    Ok(views.html.contact())
  }

}