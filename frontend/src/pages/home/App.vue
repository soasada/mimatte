<template>
    <div id="app">
        <img alt="Mimatte logo" src="@/assets/logo.png">
        <HelloWorld msg="Welcome to Your Vue.js + TypeScript App"/>
        <a href="about.html">About Us</a>
    </div>
</template>

<script lang="ts">
    import Vue from 'vue';
    import HelloWorld from '@/components/HelloWorld.vue';

    export default Vue.extend({
        name: 'app',
        components: {
            HelloWorld,
        },
    });
</script>

<style lang="scss">
    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }
</style>
