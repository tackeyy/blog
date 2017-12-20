import Vue from 'vue'
import ArchiveList from "../components/ArchiveList.vue"

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "ArchiveList",
    template: "<ArchiveList/>",
    components: {
      ArchiveList
    }
  })
})
