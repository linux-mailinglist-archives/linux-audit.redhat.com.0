Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF8F1FFBC1
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 21:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592508282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G2fyzUtpb25F6TaO/oipUVLabDSq57Fjb//MgvqkLWg=;
	b=Ko/LinCeAx8/rrJcFK2f5JV+p2vcbdzBCF/8Q2qTitEfZqhbhwJLHYpO/vD1ERpv0kfIWN
	EX9IwHbM1/4GRVwkoHrGtbjG3nqZ/ZVqr/wtd/qwejMc/51TC4E+wy0UTGFHzh8zI5LoDG
	hajfCe9ug3JBKfq5PHJRfk/afmnkMcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-E9HFgIbaMiSFjq_ohGhxsg-1; Thu, 18 Jun 2020 15:24:36 -0400
X-MC-Unique: E9HFgIbaMiSFjq_ohGhxsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 062D9C7440;
	Thu, 18 Jun 2020 19:24:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 074A2100238D;
	Thu, 18 Jun 2020 19:24:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66C2E180954D;
	Thu, 18 Jun 2020 19:24:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05II5Zhi011612 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 14:05:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6E0C1067DB1; Thu, 18 Jun 2020 18:05:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23AE1067DAF
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 18:05:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3CC61049841
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 18:05:32 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-39-NUwpuhQ8PhKpM7DQ-fMNcg-1;
	Thu, 18 Jun 2020 14:05:28 -0400
X-MC-Unique: NUwpuhQ8PhKpM7DQ-fMNcg-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id C614F20B4781;
	Thu, 18 Jun 2020 11:05:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C614F20B4781
Subject: Re: [PATCH 2/2] integrity: Add errno field in audit message
To: Mimi Zohar <zohar@linux.ibm.com>, bauerman@linux.ibm.com,
	nayna@linux.ibm.com, sgrubb@redhat.com, paul@paul-moore.com
References: <20200617204436.2226-1-nramas@linux.microsoft.com>
	<20200617204436.2226-2-nramas@linux.microsoft.com>
	<1592502095.4615.42.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <8b3c99b9-6691-5ae2-a287-a22a2c801c59@linux.microsoft.com>
Date: Thu, 18 Jun 2020 11:05:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592502095.4615.42.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05II5Zhi011612
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 18 Jun 2020 15:24:15 -0400
Cc: rgb@redhat.com, linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi8xOC8yMCAxMDo0MSBBTSwgTWltaSBab2hhciB3cm90ZToKCj4gCj4gRm9yIHRoZSByZWFz
b25zIHRoYXQgSSBtZW50aW9uZWQgcHJldmlvdXNseSwgdW5sZXNzIG90aGVycyBhcmUgd2lsbGlu
Zwo+IHRvIGFkZCB0aGVpciBSZXZpZXdlZC1ieSB0YWcgbm90IGZvciB0aGUgYXVkaXQgYXNwZWN0
IGluIHBhcnRpY3VsYXIsCj4gYnV0IElNQSBpdHNlbGYsIEknbSBub3QgY29tZm9ydGFibGUgbWFr
aW5nIHRoaXMgY2hhbmdlIGFsbCBhdCBvbmNlLgo+IAo+IFByZXZpb3VzbHkgSSBzdWdnZXN0ZWQg
bWFraW5nIHRoZSBleGlzdGluZyBpbnRlZ3JpdHlfYXVkaXRfbXNnKCkgYQo+IHdyYXBwZXIgZm9y
IGEgbmV3IGZ1bmN0aW9uIHdpdGggZXJybm8uIMKgU3RldmUgc2FpZCwgIldlIG5vcm1hbGx5IGRv
Cj4gbm90IGxpa2UgdG8gaGF2ZSBmaWVsZHMgdGhhdCBzd2luZyBpbiBhbmQgb3V0IC4uLiIsIGJ1
dCBzYWlkIHNldHRpbmcKPiBlcnJubyB0byAwIGlzIGZpbmUuIMKgVGhlIG9yaWdpbmFsIGludGVn
cml0eV9hdWRpdF9tc2coKSBmdW5jdGlvbiB3b3VsZAo+IGNhbGwgdGhlIG5ldyBmdW5jdGlvbiB3
aXRoIGVycm5vIHNldCB0byAwLgoKSWYgdGhlIG9yaWdpbmFsIGludGVncml0eV9hdWRpdF9tc2co
KSBhbHdheXMgY2FsbHMgdGhlIG5ldyBmdW5jdGlvbiB3aXRoIAplcnJubyBzZXQgdG8gMCwgdGhl
cmUgd291bGQgYmUgYXVkaXQgbWVzc2FnZXMgd2hlcmUgInJlcyIgZmllbGQgaXMgc2V0IAp0byAi
MCIgKGZhaWwpIGJlY2F1c2UgInJlc3VsdCIgd2FzIG5vbi16ZXJvLCBidXQgZXJybm8gc2V0IHRv
ICIwIiAKKHN1Y2Nlc3MpLiBXb3VsZG4ndCB0aGlzIGJlIGNvbmZ1c2luZz8KCkluIFBBVENIIDEv
MiBJJ3ZlIG1hZGUgY2hhbmdlcyB0byBtYWtlIHRoZSAicmVzdWx0IiBwYXJhbWV0ZXIgdG8gCmlu
dGVncml0eV9hdWRpdF9tc2coKSBjb25zaXN0ZW50IC0gaS5lLiwgaXQgaXMgYWx3YXlzIGFuIGVy
cm9yIGNvZGUgKDAgCmZvciBzdWNjZXNzIGFuZCBhIG5lZ2F0aXZlIHZhbHVlIGZvciBlcnJvciku
IFdvdWxkIHRoYXQgYWRkcmVzcyB5b3VyIApjb25jZXJucz8KCnRoYW5rcywKICAtbGFrc2htaQoK
CgoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

