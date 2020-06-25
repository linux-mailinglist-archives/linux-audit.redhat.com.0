Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2956C2098C6
	for <lists+linux-audit@lfdr.de>; Thu, 25 Jun 2020 05:35:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593056135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EZyMZ0AlOt4l+LDmhxKLTCg0AICbJQKme2lF9vpN1ME=;
	b=V3jifQulOABpcU+7YMfRFRKrFeUDnludB4e09o5AqPTzrsy412e1LReHBKxvdIhEEoGHSO
	e3tTNuHOqEx0zUS+gjrM4eS/wN0hHH+WY6gTCgZ8IRvn1bu76Y+UIYJPVjbZ/6nKIezmCQ
	P/ozOpi3Au0kNC2Yoq8BQEXgncGqXHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-9LfVHCezO7iIDDUhqFCYLg-1; Wed, 24 Jun 2020 23:35:32 -0400
X-MC-Unique: 9LfVHCezO7iIDDUhqFCYLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4091118A0760;
	Thu, 25 Jun 2020 03:35:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB62571698;
	Thu, 25 Jun 2020 03:35:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8336C87581;
	Thu, 25 Jun 2020 03:35:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05P3ZAOr008187 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 23:35:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC11DF566F; Thu, 25 Jun 2020 03:35:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D96EE369
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 03:35:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BDB68007A4
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 03:35:04 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-398-48zNom3WNzSkLzasvT06QQ-1; Wed, 24 Jun 2020 23:34:59 -0400
X-MC-Unique: 48zNom3WNzSkLzasvT06QQ-1
Received: by mail-qt1-f196.google.com with SMTP id v19so3582066qtq.10;
	Wed, 24 Jun 2020 20:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=6yPIIZ3W96mWZPgzbsxA5GPDuIpEloJPslMq4yRpXpg=;
	b=tk0zUYWjFBUcAPE9OzntREtur/3D6UKpRFgElGW3xnBHEtb2NmFbnH+6r3SBLx/fTB
	dkD4qNH/7y/dVDM3WWaTkRpXVmZr5yNVAiLN1c/gK4+FvM41XrqYP0qcCgKVW/UMG7up
	fLdGyjMGRqypUC4jTZ7jlHQzpc8mi5k6h7Ug18aPZZafZBHYCqctxOHPB9/Sm8wX4Om9
	CjaGSgAbl/Es8cyx2r4SCbCjf9TfHRULJ3MrtYO2884f61d6f6eSQJhPANjc+/binBPA
	JAjaU+9KZW+M2ZSxYyop7PyjI9GRfQFy2QSy8d0OEe2yjFSrOpDRBjgH13+IuMyJhD9Z
	WHAA==
X-Gm-Message-State: AOAM532zXCWeTutX3zuJ4s7RI63OARHyrlOnTUwT+WP+XG3Yo7ISc0/g
	jnlJxC0LN74di6ritLmKQ+OMgtCZnyk=
X-Google-Smtp-Source: ABdhPJxla11sKLInLjjCNdRXw0Rmgoz6FFkzG+94hiLx4EyTl46aRrUNOHRN25OpKsfM0BGRdyppvg==
X-Received: by 2002:ac8:3765:: with SMTP id p34mr30687395qtb.251.1593056097335;
	Wed, 24 Jun 2020 20:34:57 -0700 (PDT)
Received: from linux-kernel-dev (ool-182c9054.dyn.optonline.net.
	[24.44.144.84]) by smtp.gmail.com with ESMTPSA id
	p63sm3300201qkc.80.2020.06.24.20.34.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 24 Jun 2020 20:34:56 -0700 (PDT)
Date: Thu, 25 Jun 2020 03:34:56 +0000
From: Max Englander <max.englander@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: optionally print warning after waiting to enqueue
	record
Message-ID: <20200625033455.GA2576@linux-kernel-dev>
References: <20200616045855.GA1699@linux-kernel-dev>
	<CAHC9VhSotFw2i7HzWrHUyc6VSbwTpv8ZBeP58H_mzi6bd=Uouw@mail.gmail.com>
	<20200617225416.GA2688@linux-kernel-dev>
	<CAHC9VhQYaZAm4oRg4h2TiuhPR+CWp8yU4Sviao64MWwVw6nigw@mail.gmail.com>
	<20200618234836.GB3975@linux-kernel-dev>
	<20200619003009.yt5xdcpw6vggiwkl@madcap2.tricolour.ca>
	<CAHC9VhSWsX5bYX2oGhEsmWTQVk6F7S3JxJi0tmjUEo3sStXbPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSWsX5bYX2oGhEsmWTQVk6F7S3JxJi0tmjUEo3sStXbPw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDg6MTU6NTlQTSAtMDQwMCwgUGF1bCBNb29yZSB3cm90
ZToKPiBPbiBUaHUsIEp1biAxOCwgMjAyMCBhdCA4OjMwIFBNIFJpY2hhcmQgR3V5IEJyaWdncyA8
cmdiQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gMjAyMC0wNi0xOCAyMzo0OCwgTWF4IEVuZ2xh
bmRlciB3cm90ZToKPiA+ID4gSW4gY2FzZSB5b3XigJlyZSBhbnkgbW9yZSByZWNlcHRpdmUgdG8g
dGhlIGlkZWEsIEkgdGhvdWdodCBJ4oCZZCBtZW50aW9uCj4gPiA+IHRoYXQgdGhlIG5lZWQgdGhp
cyBwYXRjaCBhZGRyZXNzZXMgd291bGQgYmUganVzdCBhcyB3ZWxsIGZ1bGZpbGxlZCBpZgo+ID4g
PiB3YWl0IHRpbWVzIHdlcmUgcmVwb3J0ZWQgaW4gdGhlIGF1ZGl0IHN0YXR1cyByZXNwb25zZSBh
bG9uZyB3aXRoIG90aGVyCj4gPiA+IGN1cnJlbnRseSByZXBvcnRlZCBtZXRyaWNzIGxpa2UgYmFj
a2xvZyBsZW5ndGggYW5kIGxvc3QgZXZlbnRzLiBXYWl0Cj4gPiA+IHRpbWVzIGNvdWxkIGJlIHJl
cG9ydGVkIGFzIGEgY3VtdWxhdGl2ZSBzdW0sIGEgbW92aW5nIGF2ZXJhZ2UsIG9yIGluCj4gPiA+
IHNvbWUgb3RoZXIgd2F5LCBhbmQgd291bGQgaGVscCBkaXJlY3RseSBpbXBsaWNhdGUgb3IgcnVs
ZSBvdXQgYmFja2xvZwo+ID4gPiB3YWl0aW5nIGFzIHRoZSBjYXVzZSBpbiB0aGUgZXZlbnQgdGhh
dCBhbiBhZG1pbiBpcyBmYWNlZCB3aXRoIGRlYnVnZ2luZwo+ID4gPiBkZWdyYWRlZCBrZXJuZWwg
cGVyZm9ybWFuY2UuIEl0IHdvdWxkIGVsaW1pbmF0ZSB0aGUgbmVlZCBmb3IgYSBuZXcgZmxhZywK
PiA+ID4gYW5kIGZpdCB3ZWxsIHdpdGggdGhlIHVzZXJzcGFjZSB0b29saW5nIGFwcHJvYWNoIHlv
dSBzdWdnZXN0ZWQgYWJvdmUuCj4gPgo+ID4gU3VjaCBhcyBpcyBjYXB0dXJlZCBpbiB0aGlzIHVw
c3RyZWFtIGlzc3VlIGZyb20gMyB5ZWFycyBhZ286Cj4gPgo+ID4gICAgICAgICBodHRwczovL2dp
dGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQta2VybmVsL2lzc3Vlcy82Mwo+ID4gICAgICAgICAi
UkZFOiBhZGQga2VybmVsIGF1ZGl0IHF1ZXVlIHN0YXRpc3RpY3MiCj4gCj4gSSB3b3VsZCBiZSBt
b3JlIG9wZW4gdG8gdGhlIGlkZWEgb2YgcmVwb3J0aW5nIHF1ZXVlIHN0YXRpc3RpY3MgYXMgcGFy
dAo+IG9mIHRoZSBhdWRpdCBzdGF0dXMgaW5mb3JtYXRpb24sIG9yIHNpbWlsYXIuCj4gCj4gLS0g
Cj4gcGF1bCBtb29yZQo+IHd3dy5wYXVsLW1vb3JlLmNvbQoKRXhjZWxsZW50LCBJJ2xsIHNlbmQg
YSB2MiBwYXRjaC4KCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRp
dA==

