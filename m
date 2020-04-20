Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 723491B136B
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 19:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587404655;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i11R4vX9Z94wO+3PRmlhfrtGfuj8xZ2jJZdwwAFOqrc=;
	b=EKRE+JTUMvV2QGfYtwUoLheUHr6BVdggo2D1iY04vivoxQR4jGqHAUlg1mgl/r4JOjcmuH
	87c/ghW1PkJzxjSlqrex1dTgFQ7hAqu4WMkRMgVIqp4BpvydKHh/2Omj52OKhj9crmTVKh
	LysL294F9ucYSj3w40Ia6C2vPgz08Jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-CCTvDJIZNJGXli9a1B_gMA-1; Mon, 20 Apr 2020 13:44:12 -0400
X-MC-Unique: CCTvDJIZNJGXli9a1B_gMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90129DB2C;
	Mon, 20 Apr 2020 17:44:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B044E1001925;
	Mon, 20 Apr 2020 17:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FD4838A1;
	Mon, 20 Apr 2020 17:43:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KHhaBB011807 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 13:43:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01664100405A; Mon, 20 Apr 2020 17:43:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1BC310F8E00
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 17:43:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 076188FF66C
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 17:43:34 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-177-Qe82UUdaP-6fR-mxZD6Gdw-1; Mon, 20 Apr 2020 13:43:31 -0400
X-MC-Unique: Qe82UUdaP-6fR-mxZD6Gdw-1
Received: by mail-ed1-f68.google.com with SMTP id g16so8106376eds.1
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 10:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Sc3sWnTJx4fnmUudXTrc0ipzr3lQ2YWAxfrM9z/kKIU=;
	b=pRpETGSAvlxeibEw5pIgz0ScXSNIVvjAFv7Nk9DL35ptqVW7Avc/nUTopcVehLOYED
	EEXpETB2ajV+2HRuA6oHEwcWdru71abKT0fProjHwm1UOLsTCo/T3MehjZUlxaFAPqiN
	UCZaEIWTAnuTxGfVHAsqC165oY2y1ZtfAXs6hxae7psNFkT2G1baH9k5leYP5Zf+VrVU
	UHFOtXKrRiHBw++unzrse4wKnV4kVGNej/GUeXXDvm9KE66a8ToGejE07VNx6pX71CvF
	ojvVlTPvqQ7m1VbA43oPCo2UrAQNJys85RvMzzOOCKUvHlAhlxShh1MrEBtkDj1NLXGp
	mRVQ==
X-Gm-Message-State: AGi0PubV0F/XT1HSCkPeefLpxzlEczZdXUaKrrGCs/5JMUKaewtTyX9s
	NoJoPH1Tjd188V8MGMuR8CFfpCF4tN4m+qbpjNri
X-Google-Smtp-Source: APiQypInPLMWrXzizn1urriaVl8UaB0qsmlwfs+F52mcCkGe4Cw2Fxt8j6rhfXDXoMAAun/JAVlNgHL9CHB870TMFZ8=
X-Received: by 2002:a05:6402:1215:: with SMTP id
	c21mr15728238edw.128.1587404610032; 
	Mon, 20 Apr 2020 10:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <CANTwqXCxk0_U2heNR0ua3Pb-ic=vsJj0Jot9z=3WhTMwfRKSag@mail.gmail.com>
	<CAHC9VhQEqrwmWt8MSwv-sDXbo25K=YtBtHSy_-zR4Cy6Uk2X4w@mail.gmail.com>
In-Reply-To: <CAHC9VhQEqrwmWt8MSwv-sDXbo25K=YtBtHSy_-zR4Cy6Uk2X4w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Apr 2020 13:43:18 -0400
Message-ID: <CAHC9VhSM5Weng_QD30r+_zB+LuetO+RMVKm+CeAoPiGAXHuQeA@mail.gmail.com>
Subject: Re: kernel: audit.c: is it a memleak of net in function
	audit_send_reply
To: =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KHhaBB011807
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBBcHIgMjAsIDIwMjAgYXQgMTA6MjQgQU0gUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1v
b3JlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAyMCwgMjAyMCBhdCAzOjU0IEFNIOS6v+S4
gCA8dGVyb2luY25AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwgYWxsOgo+ID4KPiA+IHdo
ZW4gcmV2aWV3aW5nIGNvZGUgaW4gZnVuY3Rpb24gYXVkaXRfc2VuZF9yZXBseSwgSSBub3RpY2Ug
dGhhdCBpZgo+ID4ga3RocmVhZF9ydW4gcmV0dXJuIGZhaWx1cmUsIHRoZSBuZXQgcmVmZXJlbmNl
IHdvdWxkIG5vdCBiZSByZWxlYXNlZAo+ID4gYmVjYXVzZSByZXBseSBoYXMgYmVlbiBrZnJlZSBk
aXJlY3RseS4KPgo+IFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMuCj4KPiBMb29raW5nIGF0IHRo
ZSBjb2RlLCBpdCdzIGEgbGl0dGxlIHdvcnNlIHRoYW4gdGhhdC4gIElmIGt0aHJlYWRfcnVuKCkK
PiBmYWlscyB0aGVuIGF1ZGl0X3NlbmRfcmVwbHkoKSB3aWxsIHJldHVybiBlYXJseSwgaG9sZGlu
ZyBib3RoIGEKPiByZWZlcmVuY2UgdG8gQG5ldCBhcyB3ZWxsIGFzIGxlYWtpbmcgQHJlcGx5LgoK
RURJVDogSWdub3JlIHRoZSBhYm92ZSwgcmVwbHkgc2hvdWxkIGdldCBjbGVhbmVkIHVwIC4uLiBJ
IHdhcwptaXMtcmVhZGluZyAiIUVSUigpIiBhcyAiRVJSIi4KCj4gTGV0IG1lIGZpbmlzaCBnZXR0
aW5nIHRocm91Z2ggbXkgbWFpbCBhbmQgSSdsbCBwdXQgdG9nZXRoZXIgYSBxdWljawo+IHBhdGNo
IHRvIHJlc29sdmUgdGhpcyAoSSdtIHNlZWluZyBhIGZldyBvdGhlciByZWxhdGVkIHRoaW5ncyB3
ZSBzaG91bGQKPiBmaXggaW4gYXVkaXRfc2VuZF9yZXBseSgpKS4KPgo+ID4gc3RhdGljIHZvaWQg
YXVkaXRfc2VuZF9yZXBseShzdHJ1Y3Qgc2tfYnVmZiAqcmVxdWVzdF9za2IsIGludCBzZXEsIGlu
dAo+ID4gdHlwZSwgaW50IGRvbmUsCj4gPiAgICAgIGludCBtdWx0aSwgY29uc3Qgdm9pZCAqcGF5
bG9hZCwgaW50IHNpemUpCj4gPiB7Cj4gPiAgICAgc3RydWN0IG5ldCAqbmV0ID0gc29ja19uZXQo
TkVUTElOS19DQihyZXF1ZXN0X3NrYikuc2spOwo+ID4gICAgIHN0cnVjdCBza19idWZmICpza2I7
Cj4gPiAgICAgc3RydWN0IHRhc2tfc3RydWN0ICp0c2s7Cj4gPiAgICAgc3RydWN0IGF1ZGl0X3Jl
cGx5ICpyZXBseSA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBhdWRpdF9yZXBseSksCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdG
UF9LRVJORUwpOwo+ID4KPiA+ICAgICBpZiAoIXJlcGx5KQo+ID4gICAgICAgICByZXR1cm47Cj4g
Pgo+ID4gICAgIHNrYiA9IGF1ZGl0X21ha2VfcmVwbHkoc2VxLCB0eXBlLCBkb25lLCBtdWx0aSwg
cGF5bG9hZCwgc2l6ZSk7Cj4gPiAgICAgaWYgKCFza2IpCj4gPiAgICAgICAgIGdvdG8gb3V0Owo+
ID4KPiA+ICAgICByZXBseS0+bmV0ID0gZ2V0X25ldChuZXQpOyAgICAgLy8gaG9sZCBhIHJlZmVy
ZW5jZSBvZiBuZXQgaGVyZQo+ID4gICAgIHJlcGx5LT5wb3J0aWQgPSBORVRMSU5LX0NCKHJlcXVl
c3Rfc2tiKS5wb3J0aWQ7Cj4gPiAgICAgcmVwbHktPnNrYiA9IHNrYjsKPiA+Cj4gPiAgICAgdHNr
ID0ga3RocmVhZF9ydW4oYXVkaXRfc2VuZF9yZXBseV90aHJlYWQsIHJlcGx5LCAiYXVkaXRfc2Vu
ZF9yZXBseSIpOwo+ID4gICAgIGlmICghSVNfRVJSKHRzaykpCj4gPiAgICAgICAgIHJldHVybjsK
PiA+ICAgICBrZnJlZV9za2Ioc2tiKTsKPiA+Cj4gPiAgICAgb3V0Ogo+ID4gICAgICAgICBrZnJl
ZShyZXBseSk7ICAgICAgLy8ga2ZyZWUgcmVwbHkgd2l0aG91dCByZWxlYXNlIHRoZSBuZXQgcmVm
ZXJlbmNlLgo+ID4gfQo+Cj4KPgo+IC0tCj4gcGF1bCBtb29yZQo+IHd3dy5wYXVsLW1vb3JlLmNv
bQoKCgotLSAKcGF1bCBtb29yZQp3d3cucGF1bC1tb29yZS5jb20KCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

