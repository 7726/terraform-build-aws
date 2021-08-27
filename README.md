
### 해당 AWS 테라폼 프로젝트 사용 방법


해당 프로젝트는 

Route 53 - CloudFront - VPC - NAT-Gateway - ALB - EC2(Bastion Host - Front단 - Back단) - RDS 까지의 인프라를

테라폼으로 구축해본 간단한 프로젝트입니다.

테라폼 자체가 인프라만 구축해주는 역할이기에 서버 내부는 따로 설정하거나 Ansible 등을 이용하여 구성하셔야 합니다.

아직 완성 초기단계의 프로젝트라 많이 부족하지만 주석, 코드, 설명 등 부족한 부분은 점차 살을 붙여나갈 예정입니다.


> 준비할 것
> - Terraform 설치 진행 후 환경변수 설정
> - Route 53 내의 호스팅 영역에 도메인 지정
> - ACM에서 도메인의 SSL 인증서를 발급 후 ARN 복사 및 저장
> - 키 페어에서 키를 발급받아 pub키 만들기


1. AWS에서 IAM 계정을 생성

    - 프로그래밍 액세스 방식으로 설정

    - 테라폼 서비스에 사용할 서비스에 대한 권한을 설정 (빠르게 하려면 AdministratorAccess로 지정 )

    - 생성 완료하고 access_key와 secret_key 복사 및 저장


2. 각 코드에 키 값과 ACM의 ARN값 그리고 key값 넣기

    - key.tf : .pub key 파일을 프로젝트 내부나 별도의 경로에 넣고 경로 지정하기

    - key-value.tf : IAM 계정의 key값과 ACM의 ARN, DB설정 등 본인의 키값 넣기 (주의: 해당 파일(키 값)이 절대 외부에 노출되지 않도록 할 것)

    - cf-main.tf, route53-zone.tf : 본인의 도메인 값으로 교체

    - 기타 각 코드들에 선언된 변수명이나 서비스 NAME은 알아서 수정할 것


3. 명령어 수행


`terraform init`

테라폼 프로젝트 초기화 및 설정


`terraform apply`

테라폼 구축 시작


`terraform get`

새로운 모듈이 추가되었을 때 해당 명령어 사용


`terraform plan`

변경사항 적용 전 미리 실행 결과를 볼 수 있는 명령어

apply시 에러나기 전의 사항들은 전부 실행되기에 plan으로 디버깅을 진행


`terraform destroy`

테라폼으로 구축한 서비스들을 shutdown



