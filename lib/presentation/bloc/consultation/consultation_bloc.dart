import 'package:flutter_bloc/flutter_bloc.dart';
import 'consultation_event.dart';
import 'consultation_state.dart';
import '../../../domain/usecases/consultation/get_consultations_usecase.dart';
import '../../../domain/usecases/consultation/get_consultation_details_usecase.dart';
import '../../../domain/usecases/consultation/start_consultation_usecase.dart';
import '../../../domain/usecases/consultation/send_message_usecase.dart';
import '../../../domain/usecases/consultation/rate_consultation_usecase.dart';
import '../../../domain/repositories/consultation_repository.dart';

class ConsultationBloc extends Bloc<ConsultationEvent, ConsultationState> {
  final GetConsultationsUseCase _getConsultationsUseCase;
  final GetConsultationDetailsUseCase _getConsultationDetailsUseCase;
  final StartConsultationUseCase _startConsultationUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final RateConsultationUseCase _rateConsultationUseCase;

  ConsultationBloc({
    required ConsultationRepository repository,
  })  : _getConsultationsUseCase = GetConsultationsUseCase(repository),
        _getConsultationDetailsUseCase = GetConsultationDetailsUseCase(repository),
        _startConsultationUseCase = StartConsultationUseCase(repository),
        _sendMessageUseCase = SendMessageUseCase(repository),
        _rateConsultationUseCase = RateConsultationUseCase(repository),
        super(ConsultationInitial()) {
    on<GetConsultationsEvent>(_onGetConsultations);
    on<GetConsultationDetailsEvent>(_onGetConsultationDetails);
    on<StartConsultationEvent>(_onStartConsultation);
    on<SendMessageEvent>(_onSendMessage);
    on<RateConsultationEvent>(_onRateConsultation);
  }

  Future<void> _onGetConsultations(GetConsultationsEvent event, Emitter<ConsultationState> emit) async {
    emit(ConsultationLoading());
    try {
      final consultations = await _getConsultationsUseCase();
      emit(ConsultationsLoaded(consultations));
    } catch (e) {
      emit(ConsultationError(e.toString()));
    }
  }

  Future<void> _onGetConsultationDetails(GetConsultationDetailsEvent event, Emitter<ConsultationState> emit) async {
    emit(ConsultationLoading());
    try {
      final consultation = await _getConsultationDetailsUseCase(event.id);
      emit(ConsultationDetailsLoaded(consultation));
    } catch (e) {
      emit(ConsultationError(e.toString()));
    }
  }

  Future<void> _onStartConsultation(StartConsultationEvent event, Emitter<ConsultationState> emit) async {
    emit(ConsultationLoading());
    try {
      final consultation = await _startConsultationUseCase(event.data);
      emit(ConsultationStarted(consultation));
    } catch (e) {
      emit(ConsultationError(e.toString()));
    }
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<ConsultationState> emit) async {
    try {
      await _sendMessageUseCase(event.consultationId, event.message);
      emit(MessageSent());
    } catch (e) {
      emit(ConsultationError(e.toString()));
    }
  }

  Future<void> _onRateConsultation(RateConsultationEvent event, Emitter<ConsultationState> emit) async {
    try {
      await _rateConsultationUseCase(event.consultationId, event.rating, event.review);
      emit(ConsultationRated());
    } catch (e) {
      emit(ConsultationError(e.toString()));
    }
  }
}
