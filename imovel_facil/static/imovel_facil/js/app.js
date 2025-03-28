document.addEventListener('alpine:init', () => {
    Alpine.data('imovelApp', (props) => {
        return {
            mobileMenu: false,
            modalOpen: false,
            currentProperty: null,
            properties: props.imoveis || [],
            
            showProperty(id) {
                const property = this.properties.find(p => p.id === id);
                this.currentProperty = property || null;
                this.modalOpen = !!property;
            }
        }
    });

    Alpine.data('contactForm', () => {
        return {
            nome: '', 
            email: '', 
            mensagem: '',
            errors: {},
            enviando: false,
            enviado: false,
            
            validateForm() {
                this.errors = {};
                
                if (!this.nome.trim()) this.errors.nome = 'O nome é obrigatório.';
                
                if (!this.email.trim()) {
                    this.errors.email = 'O email é obrigatório.';
                } else if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(this.email)) {
                    this.errors.email = 'Email inválido.';
                }
                
                if (!this.mensagem.trim()) this.errors.mensagem = 'A mensagem é obrigatória.';
                
                return Object.keys(this.errors).length === 0;
            },
            
            submitForm() {
                if (this.validateForm()) {
                    this.enviando = true;
                        
                    // Simulação de envio, substituir por chamada AJAX real
                    setTimeout(() => {
                        this.enviando = false;
                        this.enviado = true;
                        this.nome = '';
                        this.email = '';
                        this.mensagem = '';
                        
                        // Reset após 3 segundos
                        setTimeout(() => this.enviado = false, 3000);
                    }, 1500);
                }
            }
        }
    });
});