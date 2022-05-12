//
//  PTextField+AppKit.swift
//  PingAddDevice
//
//

import AppKit
import SwiftUI
import CoreText
import Combine

struct PTextField: NSViewRepresentable {
    @Binding var textChange: String?
    
    func makeNSView(context: Context) -> some NSView {
        let textField = makeTextField()
        let container = makeTextFieldContainer(isActive: textField.$isActive)
        textField.delegate = context.coordinator
        container.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 11),
            textField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -11),
            textField.heightAnchor.constraint(equalToConstant: textFieldHeight()),
            textField.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        container.backgroundColor(.white)
        return container
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(textChange: $textChange)
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        
    }
    
    func disableFocusRing(_ field: NSTextField) {
        field.focusRingType = .none
    }
}

extension PTextField {
    class Coordinator: NSObject, NSTextFieldDelegate {
        @Binding var textChange: String?
        
        init(textChange: Binding<String?>) {
            self._textChange = textChange
        }
        
        func controlTextDidChange(_ obj: Notification) {
            guard let textField = obj.object as? _PTextField else {
                return
            }
            textChange = textField.stringValue
        }
    }
}

extension PTextField {
    private func makeTextFieldContainer(
        isActive: Published<Bool>.Publisher
    ) -> _PTextFieldContainer {
        _PTextFieldContainer(isActive: isActive)
            .size(width: 260, height: 40)
            .wantsLayer()
            .roundedCorners(radius: 5)
            .border(color: .dropdown_placeholder, width: 1.5)
            .setTranslatingMaskIntoConstraints(false)
    }
    
    private func makeTextField() -> _PTextField {
        _PTextField()
            .disableFocusRing()
            .font(.systemFont(ofSize: 17.15, weight: .light))
            .removeBorder()
            .removeShadow()
            .setTranslatingMaskIntoConstraints(false)
            .textFieldBackgroundColor(NSColor.clear)
            .singleLine()
    }
    
    func lineHeight() -> CGFloat {
        textFieldFont().getLineHeight()
    }
    
    func textFieldFont() -> NSFont {
        NSFont.systemFont(ofSize: 17.15, weight: .light)
    }
    
    func textFieldHeight() -> CGFloat {
        lineHeight()
    }
}

extension NSFont {
    func getLineHeight() -> CGFloat {
        let ctFont = CTFontCreateWithName(fontName as CFString, pointSize, nil)
        return CTFontGetBoundingBox(ctFont).height
    }
}

extension PTextField {
    func setupConstraints(container: NSView, textField: NSTextField) {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 11),
            textField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 11),
            textField.topAnchor.constraint(equalTo: container.topAnchor),
            textField.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}

extension NSView {
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
        return self
    }
    
    @discardableResult
    func roundedCorners(radius: CGFloat) -> Self {
        layer?.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func border(color: NSColor, width: CGFloat) -> Self {
        layer?.borderColor = color.cgColor
        layer?.borderWidth = width
        return self
    }
    
    @discardableResult
    func clipToBounds(_ value: Bool = true) -> Self {
        layer?.masksToBounds = value
        return self
    }
    
    @discardableResult
    func setTranslatingMaskIntoConstraints(_ value: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = value
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: NSColor) -> Self {
        layer?.backgroundColor = color.cgColor
        return self
    }
    
    @discardableResult
    func wantsLayer(_ value: Bool = true) -> Self {
        wantsLayer = value
        return self
    }
}

extension NSTextField {
    
    @discardableResult
    func disableFocusRing() -> Self {
        focusRingType = .none
        return self
    }
    
    @discardableResult
    func font(_ font: NSFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func removeBorder() -> Self {
        isBordered = false
        return self
    }
    
    @discardableResult
    func removeShadow() -> Self {
        shadow = nil
        return self
    }
    
    @discardableResult
    func textFieldBackgroundColor(_ color: NSColor) -> Self {
        drawsBackground = true
        backgroundColor = color
        return self
    }
    
    @discardableResult
    func singleLine() -> Self {
        maximumNumberOfLines = 1
        cell?.usesSingleLineMode = true
        cell?.isScrollable = true
        cell?.wraps = false
        usesSingleLineMode = true
        return self
    }
}

private class _PTextField: NSTextField {
    @Published private(set) var isActive: Bool = false
    
    override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
    
    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        isActive = result
        return result
    }
    
    override func resignFirstResponder() -> Bool {
        isActive = false
        return super.resignFirstResponder()
    }
    
    override func textDidBeginEditing(_ notification: Notification) {
        super.textDidBeginEditing(notification)
        isActive = true
    }
    
    override func textDidEndEditing(_ notification: Notification) {
        super.textDidEndEditing(notification)
        isActive = false
    }
    
    override func selectText(_ sender: Any?) {
        super.selectText(sender)
        isActive = true
    }
}

/// - TODO: Add error state
private class _PTextFieldContainer: NSView {
    private var cancellables = Set<AnyCancellable>()
    
    init(isActive: Published<Bool>.Publisher) {
        super.init(frame: .zero)
        observeActiveState(isActive)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func observeActiveState(_ isActive: Published<Bool>.Publisher) {
        isActive
            .prepend(false)
            .sink { [weak self] isActive in
                isActive ? self?.styleActive() : self?.styleInactive()
            }
            .store(in: &cancellables)
    }
    
    private func styleActive() {
        layer?.borderColor = NSColor.appBlue.cgColor
    }
    
    private func styleInactive() {
        layer?.borderColor = NSColor.dropdown_placeholder.cgColor
    }
    
}
