<template>
  <div>
    <ion-input ></ion-input>
  </div>
</template>

<script>
export default {
    data() {
        return {
            
        }
    },
methods: {
    cadastrarReserva() {
    const formData = new FormData();
      formData.append('cli', cli);
      

      axios.post('http://localhost/Api-banco/CriarTicket.php', formData)
        .then(response => {
          this.resposta = response.data.message;
          // Redirecionar para a página de visualização de reservas
        })
        .catch(error => {
          console.error(error);
        });}
    },
}
</script>

<style>

</style>