Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C2A621F9837
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jun 2020 15:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592227265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8fnaWKiYhhJ2NFoWLf2MZkTO17BJDE/h2RSKCx35E0Q=;
	b=fODoSb2Naadnxnee7nuBt/B3TKCaUTnkpF/K+30F9jPdaK1PBLHnwC/Drm+tIBcHXXC6kJ
	4c9mKKbYpimuZigXqho8pPic7Ms3kFlF2Zxi2UciY2SrAh9YEzGZB85gjEgzQjXieml3aq
	gT9vImYWP3PKxL4wtSvYHP1N3SyqoZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-hxfiU9PsME-fsZLGJTVwKw-1; Mon, 15 Jun 2020 09:21:03 -0400
X-MC-Unique: hxfiU9PsME-fsZLGJTVwKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6144100CCCB;
	Mon, 15 Jun 2020 13:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95BAB10013D6;
	Mon, 15 Jun 2020 13:20:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F5581809547;
	Mon, 15 Jun 2020 13:20:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05CJoOxC016860 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jun 2020 15:50:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 400CC1067CD6; Fri, 12 Jun 2020 19:50:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC521067CD3
	for <linux-audit@redhat.com>; Fri, 12 Jun 2020 19:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAE1A858EE5
	for <linux-audit@redhat.com>; Fri, 12 Jun 2020 19:50:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-500-j1tYoCy-MuqWRbhe8vzW9w-1;
	Fri, 12 Jun 2020 15:50:16 -0400
X-MC-Unique: j1tYoCy-MuqWRbhe8vzW9w-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id B356C205DDAF;
	Fri, 12 Jun 2020 12:50:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B356C205DDAF
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
To: Mimi Zohar <zohar@linux.ibm.com>, sgrubb@redhat.com, paul@paul-moore.com
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<1591989920.11061.90.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <42482562-d74c-2678-069f-1d8ef4feffac@linux.microsoft.com>
Date: Fri, 12 Jun 2020 12:50:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591989920.11061.90.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05CJoOxC016860
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 09:20:43 -0400
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

T24gNi8xMi8yMCAxMjoyNSBQTSwgTWltaSBab2hhciB3cm90ZToKCj4gVGhlIGlkZWEgaXMgYSBn
b29kIGlkZWEsIGJ1dCB5b3UncmUgYXNzdW1pbmcgdGhhdCAicmVzdWx0IiBpcyBhbHdheXMKPiBl
cnJuby4gwqBUaGF0IHdhcyBwcm9iYWJseSB0cnVlIG9yaWdpbmFsbHksIGJ1dCBpc24ndCBub3cu
IMKgRm9yCj4gZXhhbXBsZSwgaW1hX2FwcHJhaXNlX21lYXN1cmVtZW50KCkgY2FsbHMgeGF0dHJf
dmVyaWZ5KCksIHdoaWNoCj4gY29tcGFyZXMgdGhlIHNlY3VyaXR5LmltYSBoYXNoIHdpdGggdGhl
IGNhbGN1bGF0ZWQgZmlsZSBoYXNoLiDCoE9uCj4gZmFpbHVyZSwgaXQgcmV0dXJucyB0aGUgcmVz
dWx0IG9mIG1lbWNtcCgpLiDCoEVhY2ggYW5kIGV2ZXJ5IGNvZGUgcGF0aAo+IHdpbGwgbmVlZCB0
byBiZSBjaGVja2VkLgo+IAoKR29vZCBjYXRjaCBNaW1pLgoKSW5zdGVhZCBvZiAiZXJybm8iIHNo
b3VsZCB3ZSBqdXN0IHVzZSAicmVzdWx0IiBhbmQgbG9nIHRoZSB2YWx1ZSBnaXZlbiAKaW4gdGhl
IHJlc3VsdCBwYXJhbWV0ZXI/CgogRnJvbSB0aGUgYXVkaXQgZmllbGQgZGljdGlvbmFyeSAobGlu
ayBnaXZlbiBiZWxvdykgInJlc3VsdCIgaXMgYWxyZWFkeSAKYSBrbm93biBmaWVsZCB0aGF0IGlz
IHVzZWQgdG8gaW5kaWNhdGUgdGhlIHJlc3VsdCBvZiB0aGUgYXVkaXRlZCBvcGVyYXRpb24uCgpA
U3RldmVcUGF1bDoKTGlrZSAicmVzIiBpcyAicmVzdWx0IiBhbHNvIGV4cGVjdGVkIHRvIGhhdmUg
b25seSB2YWx1ZXMgIjAiIG9yICIxIiwgb3IgCmNhbiBpdCBiZSBhbnkgcmVzdWx0IGNvZGU/Cgpo
dHRwczovL2dpdGh1Yi5jb20vbGludXgtYXVkaXQvYXVkaXQtZG9jdW1lbnRhdGlvbi9ibG9iL21h
c3Rlci9zcGVjcy9maWVsZHMvZmllbGQtZGljdGlvbmFyeS5jc3YKCnJlcyAJYWxwaGFudW1lcmlj
IAlyZXN1bHQgb2YgdGhlIGF1ZGl0ZWQgb3BlcmF0aW9uKHN1Y2Nlc3MvZmFpbCkgCQoKcmVzdWx0
IAlhbHBoYW51bWVyaWMgCXJlc3VsdCBvZiB0aGUgYXVkaXRlZCBvcGVyYXRpb24oc3VjY2Vzcy9m
YWlsKQoKdGhhbmtzLAogIC1sYWtzaG1pCgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0Ckxp
bnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWF1ZGl0

