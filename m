Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9791C2D14A1
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 16:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607354932;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hc8uFC0hBQnb1p1OmGdF3rw7WFBRPvDd7bi4FEZNlBY=;
	b=gdTgUHkyoRtYhtuEcF3vooHQ673wTNMGUfCONVUfQJtP1afi5fR6oinjFsczLsrlXYFzR9
	HtvWHWHIC+kxbfNpvhO9xRtYJsWLbsZMhBGicd7VrbtdYULxp14sNr0W9bvK1wJgZgpB/M
	cUAMc11ND8hf+3dHEDFR+RpMZOkJ3EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-2Co7GQ4BNHi3HtxZt06Kpw-1; Mon, 07 Dec 2020 10:28:50 -0500
X-MC-Unique: 2Co7GQ4BNHi3HtxZt06Kpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50EFA1935780;
	Mon,  7 Dec 2020 15:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B8282C161;
	Mon,  7 Dec 2020 15:28:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3878B18095C9;
	Mon,  7 Dec 2020 15:28:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7FSORU022681 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 10:28:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 151EB10016FF; Mon,  7 Dec 2020 15:28:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51CBB10016FE;
	Mon,  7 Dec 2020 15:28:23 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:28:20 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: "Smith, Gary R" <Gary.Smith@pnnl.gov>
Subject: Re: Audit firewall changes in RHEL 8
Message-ID: <20201207152820.GM986374@madcap2.tricolour.ca>
References: <SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00@SJ0PR09MB6048.namprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SJ0PR09MB60481EFF857F6B4D0C65A31FFEF00@SJ0PR09MB6048.namprd09.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMC0xMi0wNSAwMDo0NSwgU21pdGgsIEdhcnkgUiB3cm90ZToKPiBHb29kIGFmdGVybm9v
biwKPiAKPiBJIGhhdmUgUkhFTCA3IHN5c3RlbXMgc2V0IHVwIHRvIGVtaXQgYXVkaXQgcmVjb3Jk
cyB3aGVuIHRoZSBmaXJld2FsbCBydWxlcyB3aXRoIGlwdGFibGVzIGNoYW5nZS4gSSBkbyBpdCB3
aXRoIGEgc2luZ2xlIGF1ZGl0IGNvbW1hbmQ6Cj4gCj4gLWEgYWx3YXlzLGV4aXQgLUYgYXJjaD1i
NjQgLVMgc2V0c29ja29wdCAtRiBhMj0weDQwIC1GIGtleT1JUFRhYmxlc0NoYW5nZQo+IAo+IEFu
ZCBpdCB3b3JrcyBncmVhdC4gSSBnZXQgYXVkaXQgbG9ncyBsaWtlIHRoaXM6Cj4gCj4gdHlwZT1Q
Uk9DVElUTEUgbXNnPWF1ZGl0KDEyLzA0LzIwMjAgMTE6MDQ6NTguODQwOjMzMzQxNzgpIDogcHJv
Y3RpdGxlPWlwdGFibGVzIC1EIElOUFVUIDIKPiB0eXBlPVNZU0NBTEwgbXNnPWF1ZGl0KDEyLzA0
LzIwMjAgMTE6MDQ6NTguODQwOjMzMzQxNzgpIDogYXJjaD14ODZfNjQgc3lzY2FsbD1zZXRzb2Nr
b3B0IHN1Y2Nlc3M9eWVzIGV4aXQ9MCBhMD0weDQgYTE9aXAgYTI9SVBUX1NPX1NFVF9SRVBMQUNF
IGEzPTB4MTAwOWNhMCBpdGVtcz0wIHBwaWQ9MTU0NzU0IHBpZD0xNjA4NTUgYXVpZD1EckV2aWwg
dWlkPXJvb3QgZ2lkPXJvb3QgZXVpZD1yb290IHN1aWQ9cm9vdCBmc3VpZD1yb290IGVnaWQ9cm9v
dCBzZ2lkPXJvb3QgZnNnaWQ9cm9vdCB0dHk9cHRzMCBzZXM9MTk4OTk1IGNvbW09aXB0YWJsZXMg
ZXhlPS91c3Ivc2Jpbi94dGFibGVzLW11bHRpIGtleT1JUHRhYmxlc0NoYW5nZQo+IHR5cGU9TkVU
RklMVEVSX0NGRyBtc2c9YXVkaXQoMTIvMDQvMjAyMCAxMTowNDo1OC44NDA6MzMzNDE3OCkgOiB0
YWJsZT1maWx0ZXIgZmFtaWx5PWlwdjQgZW50cmllcz00OAo+IAo+IEkgd2FudCB0byBkbyB0aGUg
c2FtZSB0aGluZyB3aXRoIFJIRUwgOCBhbmQgbmZ0YWJsZXMuIEkgdHJpZWQgdGhlIHNhbWUgYXVk
aXQgcnVsZSBidXQgbm90aGluZyBoYXBwZW5zLiBJIHRyaWVkIHVzaW5nIGZpcmV3YWxsLWNtZCB0
byBjaGFuZ2UgdGhlIHJ1bGVzLiBUaGUgcnVsZXMgY2hhbmdlZCwgYnV0IG5vIGF1ZGl0IHJlY29y
ZHMuIEkgZmF0IGZpbmdlcmVkIHJ1bGVzIHVzaW5nIG5mdCBidXQgbm8gYXVkaXQgcmVjb3JkLiBJ
IHN1c3BlY3QgdGhhdCBJ4oCZbSBub3Qgd3JpdGluZyB0aGUgYXVkaXQgcnVsZSBjb3JyZWN0bHku
ICBJIGxvb2tlZCBhcm91bmQgdG8gc2VlIGlmIGEyIG5lZWRlZCB0byBiZSBzb21ldGhpbmcgb3Ro
ZXIgdGhhbiAweDA0MCAoSVBUX1NPX1NFVF9SRVBMQUNFKSBidXQgSSBjb3VsZG7igJl0IGZpbmQg
YW55dGhpbmcuCgpUaGUgaG9va3Mgd2VyZSBtaXNzaW5nIGZvciBuZnRhYmxlcyBhbmQgd2VyZSB0
aGUgc3ViamVjdCBvZiB0aGUgcmVjZW50CnVwc3RyZWFtIHBhdGNoZXMgdG8gYWRkcmVzcyB0aGF0
LCBjb3ZlcmVkIGJ5IGlzc3VlOgoJaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LWF1ZGl0L2F1ZGl0
LWtlcm5lbC9pc3N1ZXMvMTI0CgpUaGUgcGF0Y2hlcyBpbiBxdWVzdGlvbiB3ZW50IGludG86CjIw
MjAtMDgtMDQgIGZkNzZhNzRkOTQwYSAgTWVyZ2UgdGFnICdhdWRpdC1wci0yMDIwMDgwMycgb2Yg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BjbW9vcmUvYXVk
aXQKIDIwMjAtMDctMDggIDY4ZGYyZWQ1NDQ4NyAgYXVkaXQ6IHVzZSB0aGUgcHJvcGVyIGdmcCBm
bGFncyBpbiB0aGUgYXVkaXRfbG9nX25mY2ZnKCkgY2FsbHMKIDIwMjAtMDYtMjkgIDE0MjI0MDM5
OGU1MCAgYXVkaXQ6IGFkZCBnZnAgcGFyYW1ldGVyIHRvIGF1ZGl0X2xvZ19uZmNmZwogMjAyMC0w
Ni0yMyAgOGU2Y2YzNjVlMWQ1ICBhdWRpdDogbG9nIG5mdGFibGVzIGNvbmZpZ3VyYXRpb24gY2hh
bmdlIGV2ZW50cwoKPiBBbnkgc3VnZ2VzdGlvbnMgb24gaG93IHRvIGRvIHRoaXMgaW4gUkhFTCA4
IHdvdWxkIGJlIGFwcHJlY2lhdGVkLgoKVGhhdCBpcyBhIGRpc3Ryby1zcGVjaWZpYyBxdWVzdGlv
biB0aGF0IHNob3VsZCBiZSBhc2tlZCBpbiB0aGUgYXBwcm9wcmlhdGUKdmVuZG9yIGZvcnVtLCBi
dXQgYXJlIGV4cGVjdGVkIHRvIGJlIGJhY2twb3J0ZWQuCgo+IEdhcnkgU21pdGgKCi0gUkdCCgot
LQpSaWNoYXJkIEd1eSBCcmlnZ3MgPHJnYkByZWRoYXQuY29tPgpTci4gUy9XIEVuZ2luZWVyLCBL
ZXJuZWwgU2VjdXJpdHksIEJhc2UgT3BlcmF0aW5nIFN5c3RlbXMKUmVtb3RlLCBPdHRhd2EsIFJl
ZCBIYXQgQ2FuYWRhCklSQzogcmdiLCBTdW5SYXljZXIKVm9pY2U6ICsxLjY0Ny43NzcuMjYzNSwg
SW50ZXJuYWw6ICg4MSkgMzI2MzUKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1h
dWRpdEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hdWRpdA==

