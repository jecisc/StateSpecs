"
I am a root of hierarchy of different kind of object properties which are used for validation of object properties in should expressions.

My subclasses should implement two methods: 
- #subPropertyAt: returning another property by constructing the state chain.
- #value returning actual value of the property.

The main subclass is sSpecOfObjectProperty while others are kind of helpers to represent the root objects: 
- the object itself
- object computed from the given block
"
Class {
	#name : #SpecOfShouldExpressionReceiver,
	#superclass : #Object,
	#category : #'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #testing }
SpecOfShouldExpressionReceiver class >> isAbstract [ 
	^self = SpecOfShouldExpressionReceiver
]

{ #category : #printing }
SpecOfShouldExpressionReceiver >> printSubject: anObject [

	^anObject stringForSpecValidation
]

{ #category : #accessing }
SpecOfShouldExpressionReceiver >> subPropertyAt: aMessage [
	self subclassResponsibility 
]

{ #category : #accessing }
SpecOfShouldExpressionReceiver >> validationSubject [
	self subclassResponsibility 
]