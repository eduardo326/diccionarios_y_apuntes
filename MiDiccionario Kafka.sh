#SOLUCION ERROR: Classpath is empty. Please build the project first e.g. by running 'gradlew jarAll'
#En la carpeta raiz de Kafka ejecutar
./gradlew jar 

#Ejecutar Zookeeper:
./bin/zookeeper-server-start.sh config/zookeeper.properties
./bin/windows/zookeeper-server-start.bat ./config/zookeeper.properties


#Ejecutar Broker de Kafka: 
./bin/kafka-server-start.sh config/server.properties
./bin/windows/kafka-server-start.bat ./config/server.properties
#Limpiar cluster de Kafka
rm -rf /tmp/kafka-logs /tmp/zookeeper

#Crear Topic
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic devs4j-topic --partitions 5 --replication-factor 1
#Listar Topic
./bin/kafka-topics.sh --list --bootstrap-server localhost:9092
./bin/windows/kafka-topics.bat --list --bootstrap-server localhost:9092
#Ver detalle de un Topic
./bin/kafka-topics.sh --describe --topic mytopic --bootstrap-server localhost:9092
./bin/windows/kafka-topics.bat --describe --topic devs4j-topic --bootstrap-server localhost:9092

#Crear un produces
./bin/kafka-console-producer.sh --topic mytopic --bootstrap-server localhost:9092
./bin/windows/kafka-console-producer.bat --topic devs4j-topic --bootstrap-server localhost:9092

#Crear un consumer
./bin/kafka-console-consumer.sh --topic mytopic --bootstrap-server localhost:9092
./bin/windows/kafka-console-consumer.bat --topic devs4j-topic --bootstrap-server localhost:9092
#Crear un sonsumer leyendo todos los mensajes previos
./bin/kafka-console-consumer.sh --topic mytopic --from-beginning --bootstrap-server localhost:9092
./bin/windows/kafka-console-consumer.bat --topic devs4j-topic --from-beginning --bootstrap-server localhost:9092
#Crear un consumer mostrando la llave (Llave-valor) de los mensajes.
./bin/kafka-console-consumer.sh --topic mytopic --bootstrap-server localhost:9092 --property print.key=true --property key.separator="-"
./bin/windows/kafka-console-consumer.bat --topic devs4j-topic --bootstrap-server localhost:9092 --property print.key=true --property key.separator="-"

#Eliminar un topic
./bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic devs4j-topic