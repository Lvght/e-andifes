from shutil import which
import subprocess


logo: str = \
"""
███████╗     █████╗ ███╗   ██╗██████╗ ██╗███████╗███████╗███████╗
██╔════╝    ██╔══██╗████╗  ██║██╔══██╗██║██╔════╝██╔════╝██╔════╝
█████╗█████╗███████║██╔██╗ ██║██║  ██║██║█████╗  █████╗  ███████╗
██╔══╝╚════╝██╔══██║██║╚██╗██║██║  ██║██║██╔══╝  ██╔══╝  ╚════██║
███████╗    ██║  ██║██║ ╚████║██████╔╝██║██║     ███████╗███████║
╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝     ╚══════╝╚══════╝
"""

# Define the Docker image version.
database_image: str = 'postgres:15.3-alpine3.18'
db_password = 'test123'
docker_command = f'docker run --name db-andifes ' \
                  '-e POSTGRES_PASSWORD={db_password} ' \
                  '-p 5432:5432 -d {database_image}'

if which('docker') is None:
    print('⚠️ Parece que você não tem Docker instalado.')
    print('   Instale-o e então execute este script novamente.')
    print('🌐 https://www.docker.com/')
    exit(1)

print(logo)

print('🐋 Garantindo a disponibilidade da imagem Docker...')
try:
    result = subprocess.run(['docker', 'pull', database_image], check=True, stderr=subprocess.PIPE)
except subprocess.CalledProcessError as e:
    error_message = e.stderr.decode().lower()
    if 'daemon' in error_message and 'not running' in error_message:
        print('❌ Docker daemon não está em execução. Por favor, inicie o Docker e tente novamente.')
    else:
        print(f'❌ Não foi possível obter a imagem Docker devido ao seguinte erro:\n{error_message}')
    exit(1)
except Exception as e:
    print(f'❌ Erro inesperado: {e}')
    exit(1)

print('Inicializando o banco. Por favor, aguarde...')
try:
    subprocess.run([
        'docker', 'run', '--name', 'db-andifes', '-e', f'POSTGRES_PASSWORD={db_password}', 
        '-p', '5432:5432', '-d', database_image], check=True, stderr=subprocess.PIPE)
except subprocess.CalledProcessError as e:
    error_message = e.stderr.decode().lower()
    if 'daemon' in error_message and 'not running' in error_message:
        print('❌ Docker daemon não está em execução. Por favor, inicie o Docker e tente novamente.')
    else:
        print(f'❌ Não foi possível inicializar o banco devido ao seguinte erro:\n{error_message}')
    exit(1)
except Exception as e:
    print(f'❌ Erro inesperado ao inicializar o banco: {e}')
    exit(1)

print('\n\n🎉 Banco inicializado com sucesso!')
print(f'🔑 Usuário: postgres | Senha: {db_password}')
print('🖥️  Para se conectar pelo terminal, execute:\n'
      '   docker exec -it db-andifes psql -U postgres')