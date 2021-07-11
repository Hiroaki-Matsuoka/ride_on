<template>
  <div id="app">
    <p>{{ message }}</p>
    <p>{{ test }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "テスト",
      test: "あああああ"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
