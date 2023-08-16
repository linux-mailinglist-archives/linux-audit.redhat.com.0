Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10E77DE50
	for <lists+linux-audit@lfdr.de>; Wed, 16 Aug 2023 12:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692180967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8JHm4AVL/Rm++sJ12fiMuCYyjtPFlaxcG80IhqWRLCc=;
	b=HtGsaBFjtcE5FS4bfi+5Ss8aLTk9vrT4BgK2bXNYJ/rzXRmGktqkdFNrl05Jr1VCWPBtXW
	L2jHWKGgJr1djEAdffTa299zFzwo1a+S9dN5+6uy9T2m2oUGuw6pmWQsbP8JAnRUAIgpvh
	py00QqLjOmwKJuU/ORA8lPIlawBeog8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-ZZeAB66eN4ei-_ESWfUbjw-1; Wed, 16 Aug 2023 06:16:03 -0400
X-MC-Unique: ZZeAB66eN4ei-_ESWfUbjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E13F0381AE42;
	Wed, 16 Aug 2023 10:16:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00795C15BAD;
	Wed, 16 Aug 2023 10:15:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 04B4C1946595;
	Wed, 16 Aug 2023 10:15:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA3241946587 for <linux-audit@listman.corp.redhat.com>;
 Wed, 16 Aug 2023 10:10:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 89D1DC15BAE; Wed, 16 Aug 2023 10:10:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81FB3C15BAD
 for <linux-audit@redhat.com>; Wed, 16 Aug 2023 10:10:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C11F3815F64
 for <linux-audit@redhat.com>; Wed, 16 Aug 2023 10:10:27 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-679-mYGE9uifPWmDT9fgK2XnGQ-1; Wed, 16 Aug 2023 06:10:22 -0400
X-MC-Unique: mYGE9uifPWmDT9fgK2XnGQ-1
Received: from fsav314.sakura.ne.jp (fsav314.sakura.ne.jp [153.120.85.145])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 37GAAHQ1055223;
 Wed, 16 Aug 2023 19:10:17 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav314.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp);
 Wed, 16 Aug 2023 19:10:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav314.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 37GAAG7i055218
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 16 Aug 2023 19:10:17 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b06dbdd8-d2f6-b190-5635-948c0a966103@I-love.SAKURA.ne.jp>
Date: Wed, 16 Aug 2023 19:10:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] audit: add task history record
To: Paul Moore <paul@paul-moore.com>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhTLQjjQ0QMfBDHYCz9LOAuO=rJWSDEUqPsFE+dowFbN=Q@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by www262.sakura.ne.jp id
 37GAAHQ1055223
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: i-love.sakura.ne.jp
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjAyMy8wOC8xNiAzOjQ0LCBQYXVsIE1vb3JlIHdyb3RlOgo+IE9uIEZyaSwgQXVnIDExLCAy
MDIzIGF0IDY6NTjigK9BTSBUZXRzdW8gSGFuZGEKPiA8cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNh
a3VyYS5uZS5qcD4gd3JvdGU6Cj4+Cj4+IFdoZW4gYW4gdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnQg
b2NjdXJzLCB0aGUgYWRtaW5pc3RyYXRvciBtYXkgd2FudCB0bwo+PiBpZGVudGlmeSB3aGljaCBh
cHBsaWNhdGlvbiB0cmlnZ2VyZWQgdGhlIGV2ZW50LiBGb3IgZXhhbXBsZSwgdW5leHBlY3RlZAo+
PiBwcm9jZXNzIHRlcm1pbmF0aW9uIGlzIHN0aWxsIGEgcmVhbCBjb25jZXJuIGVub3VnaCB0byB3
cml0ZSBhcnRpY2xlcwo+PiBsaWtlIGh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc29sdXRpb25z
LzE2NTk5MyAuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyBhIHJlY29yZCB3aGljaCBlbWl0cyBUT01P
WU8tbGlrZSB0YXNrIGhpc3RvcnkgaW5mb3JtYXRpb24KPj4gaW50byB0aGUgYXVkaXQgbG9ncyBm
b3IgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YgdW5leHBlY3RlZCBzeXN0ZW0gZXZlbnRzLgo+Pgo+
PiAgIHR5cGU9VU5LTk9XTlsxMzQwXSBtc2c9YXVkaXQoMTY5MTc1MDczOC4yNzE6MTA4KTogaGlz
dG9yeT0ibmFtZT1zd2FwcGVyLzA7cGlkPTE7c3RhcnQ9MjAyMzA4MTExOTQzMjk9Pm5hbWU9aW5p
dDtwaWQ9MTtzdGFydD0yMDIzMDgxMTE5NDM0Mz0+bmFtZT1zeXN0ZW1kO3BpZD0xO3N0YXJ0PTIw
MjMwODExMTk0NDM5PT5uYW1lPXNzaGQ7cGlkPTM2NjA7c3RhcnQ9MjAyMzA4MTExMDQ1MDQ9Pm5h
bWU9c3NoZDtwaWQ9Mzc2NztzdGFydD0yMDIzMDgxMTEwNDUzNSIKPiAKPiBXaGlsZSBJIHJlc3Bl
Y3QgeW91ciBwZXJzaXN0ZW5jZSwgd2UndmUgdGFsa2VkIGFib3V0IHRoaXMgcXVpdGUgYSBiaXQK
PiBhbHJlYWR5IGluIG90aGVyIHRocmVhZHMuICBXaGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIGlz
IGFscmVhZHkKPiBwb3NzaWJsZSB3aXRoIGF1ZGl0CgpIb3c/Cgo+ICAgICAgICAgICAgICAgICAg
ICAgYW5kL29yIFRPTU9ZTyBlbmFibGVkIGFuZCBjb25maWd1cmVkCgpXcm9uZy4gU2luY2Ugbm90
IGFsbCBMU00gaG9va3MgYWxsb3cgc2xlZXBpbmcsIFRPTU9ZTyBpcyB1bmFibGUgdG8KY2hlY2sg
c2VuZGluZyBzaWduYWxzLiBBbHNvLCBUT01PWU8gaXMgbm90IHVzaW5nIGF1ZGl0IGludGVyZmFj
ZS4KCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc28gSSBzZWUgbm8KPiByZWFzb24gd2h5IHdlIHdhbnQgdG8gbWVyZ2UgdGhpcy4KClRo
aXMgY29kZSBtYWtlcyBpdCBwb3NzaWJsZSB0byByZWNvcmQgc2VuZGluZyBzaWduYWxzIHdpdGgg
VE9NT1lPLWxpa2UgY29udGV4dCwKYW5kIHdlIGNhbiBhdm9pZCBhc3NpZ25pbmcgTFNNIElEIGZv
ciB0aGlzIGNvZGUgaWYgd2UgY2FuIG1lcmdlIHRoaXMgY29kZSBhcwphIHBhcnQgb2YgYXVkaXQu
Cgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSSB1bmRlcnN0YW5kIHlvdXIg
ZnJ1c3RyYXRpb24gdGhhdAo+IFRPTU9ZTyBpcyBub3QgZW5hYmxlZCBieSB5b3VyIHByZWZlcmVk
IGRpc3RyaWJ1dGlvbiwgYnV0IGFkZGluZwo+IGFkZGl0aW9uYWwgKGFuZCBhcmd1YWJseSByZWR1
bmRhbnQgY29kZSkgY29kZSB0byB0aGUgdXBzdHJlYW0ga2VybmVsCj4gaXMgbm90IGEgc29sdXRp
b24gSSBhbSB3aWxsaW5nIHRvIHN1cHBvcnQgYW5kIG1haW50YWluIGxvbmcgdGVybS4KCk5ldmVy
IGEgcmVkdW5kYW50IGNvZGUuIEFic29sdXRlbHkgbm8gcmVhc29uIHdlIGRvbid0IHdhbnQgdG8g
bWVyZ2UuCgpUaGUgb25seSBjaG9pY2UgaXMgd2hpY2ggYXBwcm9hY2ggKGEgc3RhbmRhbG9uZSBM
U00gbW9kdWxlIG9yIGEgcGFydCBvZiBhdWRpdCkKdG8gZ28uIENhc2V5IHN1Z2dlc3RzIHRoaXMg
Y29kZSBhcyBhIHBhcnQgb2YgYXVkaXQuIFlvdSBtdXN0IHBlcnN1YWRlIENhc2V5CmlmIHlvdSBk
b24ndCB3YW50IHRoaXMgY29kZSBhcyBhIHBhcnQgb2YgYXVkaXQuCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWF1ZGl0Cg==

