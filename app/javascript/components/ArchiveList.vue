<template>
  <section>
    <header>
      <h3>{{ label }}</h3>
    </header>
    <hr>
    <ul v-for="year in this.years" class="archive-list-ul">
      <li @click="toggle">
        <a :href="year.path">{{ year.name }}({{ year.total }})</a>
      </li>
      <ul v-for="month in year.months">
        <li @click="toggle">
          <a>{{ month.name }}({{ month.total }})</a>
        </li>
      </ul>
    </ul>
  </section>
</template>

<script>
export default {
  data () {
    return {
      label: 'アーカイブ',
      years: this.getArchives()
    }
  },
  methods: {
    toggle () {
      if (this.isFolder) {
        this.open = !this.open
      }
    },
    getArchives () {
      const node = document.getElementById('archive-list')
      return JSON.parse(node.getAttribute('data-archives'))
    }
  },
  computed: {
    isFolder: function () {
      return this.archives &&
        this.archives.length
    }
  },
}
</script>

<style lans="scss" scoped>
.archive-list-ul {
  line-height: 1.5em;
}
</style>
