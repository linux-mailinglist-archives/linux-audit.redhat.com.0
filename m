Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD2725219
	for <lists+linux-audit@lfdr.de>; Wed,  7 Jun 2023 04:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686105104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kgdbswuJT5ZoXZdEwULf7rwSXhAmca9ITB0inYFoy9Y=;
	b=YoOAq+MjUJz+Lxmg2Dlcox6+VJN/WaGHUnMAB4DP8sEOadKMrW4HUZ5KZ2uDfyp2GwP4/L
	tX0xycoJoMYhlR9eTYJ1ojsBYjBW90H24EqmJEVLeif4mkE/N96YLo+tDAv/bq0Ul95GSL
	MsxW27tyeHhzt2pQgqYuSmWAv8bw9Po=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-EuqxVEW-MwaAHkj1wNU_Zw-1; Tue, 06 Jun 2023 22:31:43 -0400
X-MC-Unique: EuqxVEW-MwaAHkj1wNU_Zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E42B3C0C88F;
	Wed,  7 Jun 2023 02:31:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2D977AE4;
	Wed,  7 Jun 2023 02:31:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4FDA419452C4;
	Wed,  7 Jun 2023 02:31:36 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 925FC19465BA for <linux-audit@listman.corp.redhat.com>;
 Wed,  7 Jun 2023 02:31:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7C6221121315; Wed,  7 Jun 2023 02:31:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.50.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A46041121314;
 Wed,  7 Jun 2023 02:31:34 +0000 (UTC)
Date: Tue, 6 Jun 2023 22:31:32 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Comprehensive Documentation on the Linux Audit Framework
Message-ID: <ZH/sBH86sqvX9IAK@madcap2.tricolour.ca>
References: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
 <ZH5VgjpTytqaj5i5@madcap2.tricolour.ca>
 <CAMKmEH_hfOO_9a=QmUC9dQezA_hn0Kj-78hsK5GpXFbNXx2G_w@mail.gmail.com>
 <10292049.nUPlyArG6x@x2>
 <CAHC9VhRkCJSLm8CG6tYX+fV7+J8QfJkqBcvZQ=6_MdbzsjuiXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRkCJSLm8CG6tYX+fV7+J8QfJkqBcvZQ=6_MdbzsjuiXw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Vincent Abraham <vincent.ahm@gmail.com>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wNi0wNiAxODowMSwgUGF1bCBNb29yZSB3cm90ZToKPiBPbiBUdWUsIEp1biA2LCAy
MDIzIGF0IDM6MDnigK9QTSBTdGV2ZSBHcnViYiA8c2dydWJiQHJlZGhhdC5jb20+IHdyb3RlOgo+
ID4gT24gVHVlc2RheSwgSnVuZSA2LCAyMDIzIDY6MzE6NTUgUE0gRURUIFZpbmNlbnQgQWJyYWhh
bSB3cm90ZToKPiA+ID4gVGhhbmtzLiBDb3VsZCB5b3UgYWxzbyBwb2ludCB0byBwb3J0aW9ucyBp
biB0aGUgY29kZWJhc2Ugd2hlcmUgdGhlc2UKPiA+ID4gZnVuY3Rpb25zIGFyZSBjYWxsZWQgZm9y
IG1vbml0b3JpbmcgZmlsZSBhY2Nlc3M/Cj4gPgo+ID4gSSdsbCBsZXQgUmljaGFyZCBvciBQYXVs
IHBvaW50IHRvIHRoZSBwbGFjZSBpbiB0aGUga2VybmVsIGlmIHRoYXQncwo+ID4gbmVjZXNzYXJ5
LiBJIHRoaW5rIHRoZXJlJ3MgYSBmdW5kYW1lbnRhbCBtaXNtYXRjaCBhbmQgaXQgbWlnaHQgbm90
IG1hdHRlci4KPiAKPiBUaGUgYXVkaXQgc3Vic3lzdGVtIGluIHRoZSBMaW51eCBLZXJuZWwgaXMg
Y3VycmVudGx5IGZvdW5kIGluIHRoZSBjb3JlCj4ga2VybmVsLyBkaXJlY3Rvcnk6Cj4gCj4gJSBs
cyAtMSBrZXJuZWwvYXVkaXQqCj4ga2VybmVsL2F1ZGl0LmMKPiBrZXJuZWwvYXVkaXRmaWx0ZXIu
Ywo+IGtlcm5lbC9hdWRpdF9mc25vdGlmeS5jCj4ga2VybmVsL2F1ZGl0LmgKPiBrZXJuZWwvYXVk
aXRzYy5jCj4ga2VybmVsL2F1ZGl0X3RyZWUuYwo+IGtlcm5lbC9hdWRpdF93YXRjaC5jCgpJIGNv
dWxkIGhhdmUgc3dvcm4gSSdkIHNlbnQgYSByZXBseSB5ZXN0ZXJkYXkgYWZ0ZXJub29uIHdpdGgg
cG9pbnRlcnMgdG8KdGhyZWUgZnVuY3Rpb25zIHRvIHN0YXJ0IHdpdGgsIGJ1dCBpdCBkaWRuJ3Qg
bWFrZSBpdCB0byB0aGUgbGlzdCBhbmQgSQpoYXZlIG5vIHJlY29yZCBvZiBpdC4uLgoKRGlyZWN0
aXZlcyBmcm9tIHVzZXJzcGFjZSBjb21lIGluIGhlcmU6CglodHRwczovL2dpdGh1Yi5jb20vbGlu
dXgtYXVkaXQvYXVkaXQta2VybmVsL2Jsb2IvbWFpbi9rZXJuZWwvYXVkaXQuYyNMMTU0MgphbmQg
YXJlIHByb2Nlc3NlZCBoZXJlOgoJaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0
LWtlcm5lbC9ibG9iL21haW4va2VybmVsL2F1ZGl0LmMjTDEyMDQKCkZvciBmaWxlIGFjY2VzcyBy
dWxlcywgc2VlIAoJaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0LWtlcm5lbC9i
bG9iL21haW4va2VybmVsL2F1ZGl0X3dhdGNoLmMKRm9yIGRpcmVjdG9yeSBhY2Nlc3MgcnVsZXMs
IGlmIHlvdSBkYXJlIHRvIHRyZWFkLCBzZWUKCWh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRp
dC9hdWRpdC1rZXJuZWwvYmxvYi9tYWluL2tlcm5lbC9hdWRpdF90cmVlLmMKCk9uY2UgcnVsZXMg
YXJlIGluIHBsYWNlLCB0aGVyZSBhcmUgaG9va3MgYWxsIG92ZXIgdGhlIGtlcm5lbCB0byBtb25p
dG9yCmFjdGl2aXR5IGluIHZhcmlvdXMgc3Vic3lzdGVtcy4KCkhhdmUgYSBsb29rIGF0IGF1ZGl0
X2xvZ19zdGFydCgpIHRoYXQgZ2VuZXJhdGVzIHRoZSBsb2cgbWVzc2FnZXM6CglodHRwczovL2dp
dGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQta2VybmVsL2Jsb2IvbWFpbi9rZXJuZWwvYXVkaXQu
YyNMMTgyOQoKYW5kIGthdWRpdGRfc2VuZF9xdWV1ZSgpIHdoaWNoIG1hbmFnZXMgdGhlIHF1ZXVl
czoKCWh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC1rZXJuZWwvYmxvYi9tYWlu
L2tlcm5lbC9hdWRpdC5jI0w3MTgKCj4gPiAuLi4gd291bGQgYmUgcGF0aCwga2luZCBvZiBhY2Nl
c3MsIHdobyBpcyBhY2Nlc3NpbmcgaXQsIHByb2dyYW0gYWNjZXNzaW5nCj4gPiBpdCwgcG9ydGlv
bnMgb2Ygc2UgbGludXggbGFiZWxpbmcsIGFuZCBhIGZldyBvdGhlciB0aGluZ3MuCj4gCj4gRllJ
IGZvciBldmVyeW9uZSBvbiB0aGUgdGhyZWFkLCB0aGUgZ2VuZXJhbGx5IGFjY2VwdGVkIHdheSB0
byB3cml0ZSB0bwo+ICJTRUxpbnV4IiBpcyBhcyBvbmUgd29yZCAobm8gc3BhY2UgYmV0d2VlbiB0
aGUgIlNFIiBhbmQgIkxpbnV4IikgYW5kCj4gd2l0aCB0aGUgZmlyc3QgdGhyZWUgbGV0dGVycyBj
YXBpdGFsaXplZC4gIEkga25vdyB3ZSBjYW4gYmUgYSBsaXR0bGUKPiBsYXp5IHdpdGggY2FwaXRh
bGl6YXRpb24sIEkgZGVmaW5pdGVseSBhbSwgYnV0IHdyaXRpbmcgaXQgYXMgb25lIHdvcmQKPiBp
cyB0aGUgaW1wb3J0YW50IHBhcnQuCj4gCj4gLS0gCj4gcGF1bC1tb29yZS5jb20KCi0gUkdCCgot
LQpSaWNoYXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPgpTci4gUy9XIEVuZ2luZWVyLCBL
ZXJuZWwgU2VjdXJpdHksIEJhc2UgT3BlcmF0aW5nIFN5c3RlbXMKUmVtb3RlLCBPdHRhd2EsIFJl
ZCBIYXQgQ2FuYWRhCklSQzogcmdiLCBTdW5SYXljZXIKVm9pY2U6ICsxLjY0Ny43NzcuMjYzNSwg
SW50ZXJuYWw6ICg4MSkgMzI2MzUKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1
ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1hdWRpdAo=

