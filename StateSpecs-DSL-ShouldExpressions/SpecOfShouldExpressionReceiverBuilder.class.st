"
I am used to create internal property instance of given object which then can be validated:

	(10@3) which x should equal: 10
	
which here returns me. 

Internal Representation and Key Implementation Points.

    Instance Variables
	property:		<SpecOfObjectProperty>

"
Class {
	#name : #SpecOfShouldExpressionReceiverBuilder,
	#superclass : #Object,
	#instVars : [
		'receiver'
	],
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfShouldExpressionReceiverBuilder class >> for: anObject [

	^self new 
		receiver: anObject asShouldExpressionReceiver
]

{ #category : #dispatching }
SpecOfShouldExpressionReceiverBuilder >> doesNotUnderstand: aMessage [

	(receiver validationSubject respondsTo: aMessage selector) 
		ifFalse: [ ^aMessage sendTo: receiver validationSubject ].
	
	receiver := receiver subPropertyAt: aMessage
]

{ #category : #printing }
SpecOfShouldExpressionReceiverBuilder >> printOn: aStream [

	aStream << 'Got '.
	receiver printOn: aStream
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> receiver [
	^ receiver
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> should [

	^SpecOfShouldExpression withReceiver: receiver
]

{ #category : #accessing }
SpecOfShouldExpressionReceiverBuilder >> value [
	^self doesNotUnderstand: (Message selector: #value)
]