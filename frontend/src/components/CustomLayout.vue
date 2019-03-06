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

<script>
    export default {
        name: 'CustomLayout'
    };
</script>

<style scoped lang="scss">

</style>