**한국어 설명** (초안이 말하는 내용, 기록의 각 주장에 대응하여):

1. 번역 기술은 발전했다.
2. 그러나 기존 번역 서비스를 사용하기에는 비용·보안 문제가 있다.
3. 그러므로 로컬에서 실행할 수 있는 작은 도메인 특화 번역 모델을 개발해야 한다.
4. 이러한 모델을 학습하려면 병렬 데이터가 필요하지만, 병렬 데이터를 사람에게 만들도록 하기는 어렵다.
5. 따라서 다른 supervision 공급원이 필요하다.
6. Teacher LLM은 양질의 번역 supervision을 제공할 수 있지만, 전체 데이터에 사용하기에는 비용이 크다.
7. 그러나 소량의 고품질 병렬 데이터만으로도 student의 번역 성능을 개선할 수 있다.
8. 그렇다면 제한된 비용으로 어떤 문장을 teacher에게 맡겨야 하는가?
9. 이 질문에 답하기 위해 QE-guided Active Data Selection(ADS)을 제안한다.
10. ADS는 student의 번역을 QE 모델로 평가하고, QE 점수가 낮은 문장을 우선 선택한다.

Each line above matches a recorded claim (C1 to C12); the explanation states nothing the record lacks.
