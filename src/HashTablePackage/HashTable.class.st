Class {
	#name : #HashTable,
	#superclass : #Object,
	#instVars : [
		'table',
		'size'
	],
	#category : #HashTablePackage
}

{ #category : #public }
HashTable >> delete: aKey [
    | index |
    index := self hash: aKey.
    (table at: index) do: [ :pair |
        (pair first = aKey) ifTrue: [ ^ (table at: index) remove: pair ].
    ].
    ^ nil

]

{ #category : #accessing }
HashTable >> hash: aKey [
    ^ aKey hash \\ size + 1

]

{ #category : #initialization }
HashTable >> initialize: aSize [
    size := aSize.
    table := Array new: size.
    1 to: size do: [ :i | table at: i put: LinkedList new ].

]

{ #category : #'as yet unclassified' }
HashTable >> insert: aKey value: aValue [
	 
    | index |
  
    index := self hash: aKey.
    (table at: index) add: { aKey . aValue }

]

{ #category : #printing }
HashTable >> print [
    table do: [ :list |
        list do: [ :pair |
            Transcript show: pair first printString; show: ' -> '; show: pair second printString; show: ', '.
        ].
    ].
    Transcript cr.
]

{ #category : #'typing/selecting keys' }
HashTable >> search: aKey [
    | index |
    index := self hash: aKey.
    (table at: index) do: [ :pair |
        (pair first = aKey) ifTrue: [ ^ pair second ].
    ].
    ^ nil

]
