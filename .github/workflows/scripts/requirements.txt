-- JFA MIB ESPECIFICATION
--

JFA-MIB DEFINITIONS ::= BEGIN

IMPORTS
   MODULE-IDENTITY,enterprises, 
   IpAddress ,Integer32		   				FROM SNMPv2-SMI
   -- Gauge, TimeTicks     						FROM RFC1155-SMI
   DisplayString                                FROM SNMPv2-TC
   OBJECT-TYPE                                  FROM RFC-1212
   NOTIFICATION-TYPE                        	FROM SNMPv2-SMI
   -- TRAP-TYPE                                 FROM RFC-1215
   SnmpSecurityModel,
   SnmpMessageProcessingModel,
   SnmpSecurityLevel,
   SnmpAdminString				      			FROM SNMP-FRAMEWORK-MIB
   KeyChange									FROM SNMP-USER-BASED-SM-MIB
   TEXTUAL-CONVENTION							FROM SNMPv2-TC
   MODULE-COMPLIANCE, OBJECT-GROUP , 
   NOTIFICATION-GROUP      						FROM SNMPv2-CONF;

jfaInfo MODULE-IDENTITY
    LAST-UPDATED "201909130000Z"
    ORGANIZATION "JFA"
    CONTACT-INFO
                  "jfaeletronicos.com"
    DESCRIPTION
        "Arquivo MIB para fonte gerenciável"

	REVISION 	"202106290000Z"
	DESCRIPTION
        "The MIB module for SMIv2."
    ::= { jfa 1 }   
   
jfa                   OBJECT IDENTIFIER ::=  { enterprises 17095 }

product                     OBJECT IDENTIFIER ::=  { jfaInfo 1 }
setup                       OBJECT IDENTIFIER ::=  { jfaInfo 2 }
control                     OBJECT IDENTIFIER ::=  { jfaInfo 3 }
snmpUsm			    		OBJECT IDENTIFIER ::=  { jfaInfo 4 }
snmpTrap					OBJECT IDENTIFIER ::=  { jfaInfo 5 }
snmpv3PvtObject				OBJECT IDENTIFIER ::=  { jfaInfo 6 }
trapNotifications 			OBJECT IDENTIFIER ::=  { jfaInfo 0 }

mchipMIBConformance         OBJECT IDENTIFIER ::=  { jfaInfo 8 }

mchipMIBCompliances         OBJECT IDENTIFIER ::= { mchipMIBConformance 1 }
mchipMIBGroups  			OBJECT IDENTIFIER ::= { mchipMIBConformance 2 }



  -- ON-OFF          ::=   INTEGER { ON(1), OFF(0) }

MCHPUsmAuthPrivProtocol ::=  TEXTUAL-CONVENTION
       STATUS  current
       DESCRIPTION
           "This textual convention enumerates the authentication and privledge 
		protocol for USM configuration.
           "
       SYNTAX    INTEGER
 			{
				noAuthProtocol(1),
				hmacMD5Auth(2),
				hmacSHAAuth(3),
				noPrivProtocol(4),
				desPrivProtocol(5),
				aesPrivProtocol(6)
			}


name    OBJECT-TYPE
   SYNTAX DisplayString
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Fonte gerenciável"
   ::= { product 1 }
   

version    OBJECT-TYPE
   SYNTAX DisplayString
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Versao 1.0"
   ::= { product 2 }
   
date    OBJECT-TYPE
   SYNTAX DisplayString
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Data da versao"
   ::= { product 3 }
   
fontealimentacao    OBJECT-TYPE
    SYNTAX INTEGER { LIGADA(1), DESLIGADA(0) }
    MAX-ACCESS read-write
    STATUS current
    DESCRIPTION 
        "Controle da fonte"
    ::= { control 1 }

tensaodesaida    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Tensao na saida da fonte"
   ::= { control 2 }	    

correntedesaida    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Corrente na saida da fonte"
   ::= { control 3 }

tensaodecarregador    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Tensao no carregador da fonte"
   ::= { control 4 }	 

correntedocarregador    OBJECT-TYPE
   SYNTAX DisplayString (SIZE (0..7))
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Corrente no carregador da fonte"
   ::= { control 5 }	 

temperatura    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Temperatura"
   ::= { control 6 }

modooperacao    OBJECT-TYPE
    SYNTAX INTEGER { Bateria(1), Rede(0) }
    MAX-ACCESS read-only
    STATUS current
    DESCRIPTION 
        "Modo de operação da fonte"
    ::= { control 7 }

vac		OBJECT-TYPE
   SYNTAX DisplayString
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Tensão da Rede Elétrica"
   ::= { control 8 }

ratio	OBJECT-TYPE
   SYNTAX DisplayString
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Carga da Bateria"
   ::= { control 9 }

evt1    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 1"
   ::= { control 10 }

evt2    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 2"
   ::= { control 11 }

evt3    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 3"
   ::= { control 12 }

evt4    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 4"
   ::= { control 13 }

evt5    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 5"
   ::= { control 14 }

evt6    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 6"
   ::= { control 15 }

evt7    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 7"
   ::= { control 16 }

evt8    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 8"
   ::= { control 17 }

evt9    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 9"
   ::= { control 18 }

evt10    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração Evento AC 10"
   ::= { control 19 }

model    OBJECT-TYPE
   SYNTAX INTEGER { 
				Fonte_Gerenciavel_12V_20A(0),
				Fonte_Gerenciavel_24V_10A(1),
				Fonte_Gerenciavel_24V_20A(2), 
                Fonte_Gerenciavel_48V_8A(3), 
				Fonte_Gerenciavel_48V_15A(4), 
				Fonte_Gerenciavel_48V_30A(5)
			}
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Modelo da Fonte"
   ::= { control 20 }

battst    OBJECT-TYPE
    SYNTAX INTEGER { On(1), Off(0) }
    MAX-ACCESS read-only
    STATUS current
    DESCRIPTION 
        "Teste de Autonomia da Bateria"
    ::= { control 21 }

durbattst    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Duração do Teste de Autonomia"
   ::= { control 22 }

hraftbattst    OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Qte. de Dias desde o último teste Autonomia"
   ::= { control 23 }

fwver   	OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Versão do FW"
   ::= { control 24 }	    

gwver   	OBJECT-TYPE
   SYNTAX INTEGER
   MAX-ACCESS read-only
   STATUS current
   DESCRIPTION
      "Versão do GERENCIADOR"
   ::= { control 25 }	    

trapTable OBJECT-TYPE
    SYNTAX SEQUENCE OF TrapEntry
    MAX-ACCESS not-accessible
    STATUS current
    DESCRIPTION
        "Trap table"
    ::= { setup 1 }        
    
trapEntry OBJECT-TYPE
    SYNTAX TrapEntry
    MAX-ACCESS not-accessible
    STATUS current
    DESCRIPTION
        "Single trap entry containing trap receiver info."
    INDEX { trapReceiverNumber }
     ::= { trapTable 1 }
     
TrapEntry ::=
    SEQUENCE {
        trapReceiverNumber
            Integer32,
        trapEnabled
            Integer32,
        trapReceiverIPAddress
            IpAddress,
        trapCommunity
            DisplayString
    }            
    
trapReceiverNumber  OBJECT-TYPE

    SYNTAX Integer32(0.. 4)
    MAX-ACCESS not-accessible
    STATUS current
    DESCRIPTION
        "Index of trap receiver"
    ::= { trapEntry 1 }
    
trapEnabled OBJECT-TYPE
    SYNTAX INTEGER { no(0),yes(1) }
    MAX-ACCESS read-write
    STATUS current
    DESCRIPTION
        "Indicates if this trap entry is enabled or not."
    ::= { trapEntry 2 }


trapReceiverIPAddress OBJECT-TYPE
    SYNTAX  IpAddress
    MAX-ACCESS  read-write
    STATUS current
    DESCRIPTION
        "Trap receiver IP address"
    ::= { trapEntry 3 }

trapCommunity OBJECT-TYPE
    SYNTAX  DisplayString (SIZE (0..7))
    MAX-ACCESS  read-write
    STATUS current
    DESCRIPTION
        "Trap community to be used by agent to send trap"
    ::= { trapEntry 4 }


mchpUsmUserTable     OBJECT-TYPE
    SYNTAX       SEQUENCE OF MchpUsmUserEntry
    MAX-ACCESS   not-accessible
    STATUS       current
    DESCRIPTION "This table is used to configure microchip USM.
		     To get the SNMPv3 access, user need to configure security 
		     name,authentication,auth password,priv protocol and priv 
                 password.
		     
		    "
    ::= { snmpUsm 1 }

mchpUsmUserEntry     OBJECT-TYPE
    SYNTAX       	MchpUsmUserEntry
    MAX-ACCESS    not-accessible
    STATUS       	current
    DESCRIPTION 	"User security configurations for USM.
                	"
    INDEX       { usmIndex }
    ::= { mchpUsmUserTable 1 }

MchpUsmUserEntry   ::= SEQUENCE {
	    usmIndex		Integer32,
	    usmSecurityName	SnmpAdminString,
          usmAuthProtocol     MCHPUsmAuthPrivProtocol,
          usmAuthKey		KeyChange,
          usmPrivProtocol     MCHPUsmAuthPrivProtocol,
          usmPrivKey		KeyChange
    }

usmIndex	  	OBJECT-TYPE
    SYNTAX 		Integer32 (1..3)     
    MAX-ACCESS   not-accessible
    STATUS       current
    DESCRIPTION  "Usm configuration index. "
    ::= { mchpUsmUserEntry 1 }


usmSecurityName  OBJECT-TYPE
    SYNTAX       SnmpAdminString
    MAX-ACCESS   read-write
    STATUS       current
    DESCRIPTION "A human readable string representing the user in
                 Security Model independent format.

                 The default transformation of the User-based Security
                 Model dependent security ID to the securityName and
                 vice versa is the identity function so that the
                 securityName is the same as the userName.
                "
    ::= { mchpUsmUserEntry 2 }


usmAuthProtocol OBJECT-TYPE
    SYNTAX       MCHPUsmAuthPrivProtocol
    MAX-ACCESS   read-write
    STATUS       current
    DESCRIPTION  "Authentication support to the SNMPv3.
		     If usmAuthProtocol == NoAuthProtocol, then SNMPv3 Stack does 
		     not support/requires authentication.
		     If usmAuthProtocol == HMACMD5Auth , supports MD5 auth
		     If usmAuthProtocol == HMACSHAAuth, supports SHA Auth 	
                 If a set operation tries to set value as
                 NoAuthProtocol while the usmPrivProtocol value
                 for the same userName is not equal to NoPrivProtocol,
                 then an 'inconsistentValue' error must be returned.
                 This implies that SNMP command generator (SNMP Manager)
		     application must first ensure that the usmPrivProtocol is set
                 to NoPrivProtocol value before it can set
                 the usmAuthProtocol value to NoAuthProtocol.
                "
    ::= { mchpUsmUserEntry 3 }

usmAuthKey OBJECT-TYPE
    SYNTAX       KeyChange   -- typically (SIZE (0 | 32)) for HMACMD5
                             -- typically (SIZE (0 | 40)) for HMACSHA
    MAX-ACCESS   read-write
    STATUS       current
    DESCRIPTION  "This object in the MIB is associated to usmAuthProtocol.
			A secret authentication key is required to establish a secure connection 
			between snmp agent and manager.
		    "			
    ::= { mchpUsmUserEntry 4 }


usmPrivProtocol OBJECT-TYPE
    SYNTAX       MCHPUsmAuthPrivProtocol
    MAX-ACCESS   read-write
    STATUS       current
    DESCRIPTION " A privacy protocol to provide encryption and decryption
			of SNMPv3 pdu. 
                "
    ::= { mchpUsmUserEntry 5 }

usmPrivKey OBJECT-TYPE
    SYNTAX       KeyChange  -- typically (SIZE (0 | 32)) for DES
    MAX-ACCESS   read-write
    STATUS       current
    DESCRIPTION "This object in the MIB is associated to usmPrivProtocol.
			A secret privacy key is required to establish a secure connection 
			between snmp agent and manager.

                "
    ::= { mchpUsmUserEntry 6 }


-- Target MIB 

mchpTargetTable OBJECT-TYPE
       SYNTAX      SEQUENCE OF MchpTargetEntry
       MAX-ACCESS      not-accessible
       STATUS      current
       DESCRIPTION
           "A table for SNMP target information. This information is required for
           generation of SNMP trap notifications."
       ::= { snmpTrap 1 }

mchpTargetEntry OBJECT-TYPE
       SYNTAX      MchpTargetEntry
       MAX-ACCESS      not-accessible
       STATUS      current
       DESCRIPTION
           "A set of SNMP target information.
           "
       INDEX { snmpTargetIndex }
       ::= { mchpTargetTable 1 }

MchpTargetEntry ::= SEQUENCE {
       snmpTargetIndex          Integer32,
       snmpTargetMPModel        SnmpMessageProcessingModel,
       snmpTargetSecurityModel  SnmpSecurityModel,
       snmpTargetSecurityName   SnmpAdminString,
       snmpTargetSecurityLevel  SnmpSecurityLevel
   }

snmpTargetIndex OBJECT-TYPE
       SYNTAX      Integer32(1..8)
       MAX-ACCESS  	 not-accessible
       STATUS      current
       DESCRIPTION
           "The locally arbitrary, but unique identifier associated
            with mchpTargetEntry."
       ::= { mchpTargetEntry 1 }

snmpTargetMPModel OBJECT-TYPE
       SYNTAX      SnmpMessageProcessingModel
       MAX-ACCESS      read-write
       STATUS      current
       DESCRIPTION
           "The Message Processing Model to be used when generating/processing
            SNMP messages using this entry."
       ::= { mchpTargetEntry 2 }

snmpTargetSecurityModel OBJECT-TYPE
       SYNTAX      SnmpSecurityModel (1..2147483647)
       MAX-ACCESS      read-write
       STATUS      current
       DESCRIPTION
           "The Security Model to be used while generating SNMP
             messages using this entry.  An implementation may
             choose to return an inconsistentValue error if an
             attempt is made to set this variable to a value
             for a security model which the implementation does
             not support."
       ::= { mchpTargetEntry 3 }

snmpTargetSecurityName OBJECT-TYPE
       SYNTAX      SnmpAdminString
       MAX-ACCESS      read-write
       STATUS      current
       DESCRIPTION
           "The securityName which identifies the Principal on
            whose behalf SNMP messages will be generated.
		"
       ::= { mchpTargetEntry 4 }

snmpTargetSecurityLevel OBJECT-TYPE
       SYNTAX      SnmpSecurityLevel
       MAX-ACCESS      read-write
       STATUS      current
       DESCRIPTION
           "The Level of Security to be used when generating
            SNMP messages using this entry."
       ::= { mchpTargetEntry 5 }

   
snmp-demo-trap NOTIFICATION-TYPE
	OBJECTS { analogPot0,pushButton,ledD5,trapCommunity}
	STATUS current
	DESCRIPTION 
		"SMIV2 Trap notification information for the SNMP Manager. 
		The objects used in the demo trap notification are 
		analogPot0,pushButton,ledD5 and trapCommunity. User should modify this object 
		information as per the requirements. These object should 
		have been defined as part of the MIB.
		"
	::= {trapNotifications 1}
	
	
mchipDemoCompliance1 MODULE-COMPLIANCE
    STATUS  current
	DESCRIPTION
            "This group is for SNMP demo applications."
    MODULE  -- this module
        MANDATORY-GROUPS { mchipDemoGroup1, mchipDemoGroup2}

    ::= { mchipMIBCompliances 1 }
	
mchipDemoCompliance2 MODULE-COMPLIANCE
    STATUS  current
	DESCRIPTION
            "This group is for trap demo applications."
    MODULE  -- this module
        MANDATORY-GROUPS {mchipDemoGroup3}

    ::= { mchipMIBCompliances 2 }	
			
mchipDemoGroup1 OBJECT-GROUP
    OBJECTS { name, version,date,ledD5,ledD6,pushButton,
			  analogPot0,analogPot1,lcdDisplay,
              trapEnabled,trapReceiverIPAddress,trapCommunity}
    STATUS  current
    DESCRIPTION
            "A collection of objects providing basic product
            and control of a product."
    ::= { mchipMIBGroups 1 }	

mchipDemoGroup2 OBJECT-GROUP
    OBJECTS { usmSecurityName,usmAuthProtocol,usmAuthKey,
			 usmPrivProtocol,usmPrivKey,snmpTargetMPModel,
			 snmpTargetSecurityModel,snmpTargetSecurityName,
			 snmpTargetSecurityLevel}
    STATUS  current
    DESCRIPTION
            "A collection of objects are used for SNMPV3 Configuration."
    ::= { mchipMIBGroups 2 }	

mchipDemoGroup3 NOTIFICATION-GROUP
    NOTIFICATIONS  {snmp-demo-trap}
    STATUS  current
    DESCRIPTION
            "SNMP Trap Notification object."
    ::= { mchipMIBGroups 3 }		

END   
