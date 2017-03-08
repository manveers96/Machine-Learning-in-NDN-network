# Machine-Learning-in-NDN-network
Implementation of backpropagation algorithm in MATLAB to detect DDOS (Distributed Denial Of Service) Attack in NDN(Named Data Networking).

# NDN(NAMED DATA NETWORKING)
Named Data Networking (NDN) (related to Content-Centric Networking (CCN), content-based networking,
data-oriented networking or information-centric networking) is a Future Internet architecture inspired
by years of empirical research into network usage and a growing awareness of unsolved problems in
contemporary internet architectures like IP. NDN has its roots in an earlier project,
Content-Centric Networking (CCN), which Van Jacobson first publicly presented in 2006. The NDN
project is investigating Jacobson’s proposed evolution from today’s host-centric network architecture
IP to a data-centric network architecture (NDN). The belief is that this conceptually simple shift
will have far-reaching implications for how people design, develop, deploy, and use networks 
and applications.


# Communication in NDN
Communication in NDN is driven by the receiving end, i.e., the data consumer.To receive data, a consumer
sends out an Interest packet, which carries a name that identifies the desired data. A router remembers 
the interface from which the request comes in, and then forwards the Interest packet by looking up the 
name in its Forwarding Information Base (FIB), which is populated by a name-based routing protocol. Once
the Interest reaches a node that has the requested data, a Data packet is sent back, which carries both
the name and the content of the data, together with a signature by the producer’s key. This
Datapacket follows in reverse the path taken by the Interest to get back to the consumer. Note that neither
Interest nor Data packets carry any host or interface addresses (such as IP addresses); Interest packets
are routedtowards data producers based on the names carried in the Interest packets, and Data packets are
returned based on the state information set up by the Interests at each router hop.

The router stores in a Pending Interest Table (PIT) all the Interests waiting for returning Data packets.
When multiple Interests for the same data are received from downstream, only the first one is sent upstream
towards the data source. Each PIT entry contains the name of the Interest and a set of interfaces from which
the Interests for the same name have been received. When a Data packet arrives, the router finds the matching
PIT entry and forwards the data to all the interfaces listed in the PIT entry. The router then removes the
corresponding PIT entry, and caches the Data in the Content Store. Because an NDN Data packet is meaningful
independent of where it comes from or where it may be forwarded to, the router can cache it to satisfy future
requests. Because one Data satisfies one Interest across each hop, an NDN network achieves hop-by-hop flow 
balance.

<img src="https://github.com/manveers96/Machine-Learning-in-NDN-network/blob/master/ndn.png"/>


# Input Parameters For Detecting DDOS Attack through backpropagation
InInterests measurements of incoming Interests

OutInterests measurements of outgoing Interests

InData measurements of incoming Data

OutData measurements of outgoing Data

InNacks measurements of outgoing NACKs

OutNacks measurements of outgoing NACKs

SatisfiedInterests measurements of satisfied Interests (totals for all faces) [IGNORED due to redundancy]

TimedOutInterests measurements of timed out Interests (totals for all faces) [IGNORED due to redundancy]

InSatisfiedInterests measurements of incoming satisfied Interests (per incoming face)

InTimedOutInterests measurements of incoming timed out Interests (per incoming face)

OutSatisfiedInterests measurements of outgoing satisfied Interests (per outgoing face)

OutTimedOutInterests measurements of outgoing satisfied Interests (per outgoing face)



# No of Hidden Layers = 2



# No of nodes in the Hidden Layers = 20



# Activation Function 
1) SIGMOID 

2) SOFTMAX



# OUTPUT LAYERS = 2 
"10" for ATTACK.

"01" for NO-ATTACK.



# Basic Forward Propagation Code
function res = forwardPropagation(X, Theta1, Theta2);

m = size(X, 1);

X = [ones(m,1) X]; % X = (m x n+1)

tmp = sigmoid(X * Theta1'); %tmp = m x h

tmp = [ones(m,1) tmp];

res = sigmoid(tmp * Theta2'); %res = (m X o) matrix

for i = 1:m

if (res(i,1) >= res(i,2))

res(i,1) = 1;

res(i,2) = 0;

else

res(i,1) = 0;

res(i,2) = 1;

endif;

end;

end;
