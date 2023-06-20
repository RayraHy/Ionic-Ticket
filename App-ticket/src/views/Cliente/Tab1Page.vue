<template>
  <ion-page>
    <ion-content :fullscreen="true">
      <ion-button class="Bu" @click="openModal" >Adicionar ticket</ion-button>

      <ion-modal :show="showModal" @dismiss="closeModal">
      <ion-content class="ion-padding">
        <h2>Modal</h2>
        <p>Conteúdo do modal.</p>
        <ion-button expand="full" @click="closeModal">Fechar</ion-button>
      </ion-content>
    </ion-modal>
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonModal, IonButton } from '@ionic/vue';

export default {
  components: {
    IonContent, IonModal, IonPage, IonButton
  },
  data() {
    return {
      showModal: false
    }
  },
  methods: {
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    }
  }
}
</script>

<style scoped>
.Bu {
  padding-bottom: 20px;
  margin-left: 50px;
}
</style>
