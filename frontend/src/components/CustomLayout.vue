<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-9">
                <slot name="mainContent"></slot>
            </div>
            <div class="col-3">
                <slot name="sidebarContent"></slot>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
    import Vue from 'vue';

    export default Vue.extend({
        name: 'CustomLayout',
    });
</script>

<style scoped>

</style>