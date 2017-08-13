<template>
  <section>
    <header>
      <h3>{{ label }}</h3>
    </header>
    <hr>
    <ul v-for="year in this.years" class="archive-list-ul">
      <li @click="toggle">
        <span v-if="year.total == 0">{{ year.name }}({{ year.total }})</span>
        <a v-else :href="year.path">{{ year.name }}({{ year.total }})</a>
      </li>
      <ul v-for="month in year.months">
        <li @click="toggle">
          <span v-if="month.total == 0">{{ month.name }}({{ month.total }})</span>
          <a v-else :href="month.path">{{ month.name }}({{ month.total }})</a>
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
