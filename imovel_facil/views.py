from django.shortcuts import render
from django.core.serializers.json import DjangoJSONEncoder
import json
from .models import Imovel

def pagina_inicial(request):
    # Buscar todas as casas do banco de dados
    imoveis = Imovel.objects.all()
    
    # Serializar as casas para JSON (para Alpine.js)
    imoveis_list = []
    for imovel in imoveis:
        imoveis_list.append({
            'id': imovel.id,
            'categoria': imovel.categoria,
            'cozinha': imovel.cozinha,
            'sala': imovel.sala,
            'quarto': imovel.quarto,
            'casa_de_banho': imovel.casa_de_banho,
            'garagem': imovel.garagem,
            'numero_de_comodo': imovel.numero_de_comodo,
            'area': imovel.area,
            'endereco': imovel.endereco,
            'preco': f"€ {imovel.preco:,}".replace(',', '.'),
            'descricao': imovel.descricao,
            # Adiciona o campo virtual 'nome' e 'imagem'
            'nome': imovel.nome,  # Usa a propriedade nome que definimos
            'imagem': imovel.imagem,  # Usa a propriedade imagem que definimos
        })
    
    # Seleciona um imóvel de destaque (por exemplo, o mais recente ou mais caro)
    imovel_destaque = Imovel.objects.order_by('-preco').first()
    
    imoveis_json = json.dumps(imoveis_list, cls=DjangoJSONEncoder)
    
    return render(request, 'imovel_facil/pagina-inicial.html', {
        'imovel_destaque': imovel_destaque,
        'imoveis': imoveis,
        'imoveis_json': imoveis_json
    })