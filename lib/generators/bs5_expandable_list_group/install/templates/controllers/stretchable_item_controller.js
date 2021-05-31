import { Controller } from "stimulus";

const SHOW_EVENT = "show.bs.collapse";
const HIDE_EVENT = "hide.bs.collapse";

export default class extends Controller {
  static targets = ["container"];
  static classes = ["item", "stretched"];

  initialize() {
    this.onShow = this._onShow.bind(this);
    this.onHide = this._onHide.bind(this);
    this.contentNode = this.element.querySelector(".collapse");
  }

  connect() {
    this.containerTarget.classList.add(this.itemClass);
    this.contentNode.addEventListener(SHOW_EVENT, this.onShow);
    this.contentNode.addEventListener(HIDE_EVENT, this.onHide);
  }

  disconnect() {
    this.contentNode.removeEventListener(SHOW_EVENT, this.onShow);
    this.contentNode.removeEventListener(HIDE_EVENT, this.onHide);
  }

  _onShow() {
    this.containerTarget.classList.add(this.stretchedClass);
  }

  _onHide() {
    this.containerTarget.classList.remove(this.stretchedClass);
  }
}
