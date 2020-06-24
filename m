Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3B829207A87
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 19:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593020743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uHBrPClZzvpJE+qjsNzion6yI385Fs/eI+RSlyEwciw=;
	b=aiZju18slRZmCCTuPBlLqnJeqswwfT1DcPKaCvzXZkCsD/HE55Z1qpPuGxOjTH5DXRJOEF
	8yvlBPXZTlO2DD71x1Q/1KM+7K3gJOM6E9Zyuklh3k5VSSqZfcIflGM13FH1ed+T05Tset
	/ira1lp3FR/D+PEE4tBUskwUqYwzJSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-4YJYmAyzPwyaBO57tYDkJA-1; Wed, 24 Jun 2020 13:45:40 -0400
X-MC-Unique: 4YJYmAyzPwyaBO57tYDkJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D959B2BED;
	Wed, 24 Jun 2020 17:45:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C7260C1D;
	Wed, 24 Jun 2020 17:45:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69B4187588;
	Wed, 24 Jun 2020 17:45:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OHPRqT009765 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 13:25:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9241F1007399; Wed, 24 Jun 2020 17:25:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD4D10CD85E
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 17:25:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 274A78007CF
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 17:25:25 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-465-ITjy8RC4M3aattoKvZX1uQ-1;
	Wed, 24 Jun 2020 13:25:22 -0400
X-MC-Unique: ITjy8RC4M3aattoKvZX1uQ-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 362F920B7192;
	Wed, 24 Jun 2020 10:25:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 362F920B7192
Subject: Re: [PATCH v3 2/2] IMA: Add audit log for failure conditions
To: Mimi Zohar <zohar@linux.ibm.com>, sgrubb@redhat.com, paul@paul-moore.com
References: <20200618211012.2823-1-nramas@linux.microsoft.com>
	<20200618211012.2823-2-nramas@linux.microsoft.com>
	<1592942295.5389.9.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <39d66bdc-55be-984a-42a0-34d0a011e0fb@linux.microsoft.com>
Date: Wed, 24 Jun 2020 10:25:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592942295.5389.9.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05OHPRqT009765
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 24 Jun 2020 13:45:21 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi8yMy8yMCAxMjo1OCBQTSwgTWltaSBab2hhciB3cm90ZToKCkhpIFN0ZXZlXFBhdWwsCgo+
PiBTYW1wbGUgYXVkaXQgbWVzc2FnZXM6Cj4+Cj4+IFsgICAgNi4zMDMwNDhdIGF1ZGl0OiB0eXBl
PTE4MDQgYXVkaXQoMTU5MjUwNjI4MS42Mjc6Mik6IHBpZD0xIHVpZD0wCj4+IGF1aWQ9NDI5NDk2
NzI5NSBzZXM9NDI5NDk2NzI5NSBzdWJqPWtlcm5lbCBvcD1tZWFzdXJpbmdfa2V5Cj4+IGNhdXNl
PUVOT01FTSBjb21tPSJzd2FwcGVyLzAiIG5hbWU9Ii5idWlsdGluX3RydXN0ZWRfa2V5cyIgcmVz
PTAKPj4gZXJybm89LTEyCj4gCj4gTXkgb25seSBjb25jZXJuIGlzIHRoYXQgYXVkaXRpbmcgLUVO
T01FTSB3aWxsIHB1dCBhZGRpdGlvbmFsIG1lbW9yeQo+IHByZXNzdXJlIG9uIHRoZSBzeXN0ZW0u
IMKgSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgYSBjb25jZXJuIGFuZCwgaWYgc28sCj4gaG93IGl0
IHNob3VsZCBiZSBoYW5kbGVkLgoKRG8geW91IGhhdmUgYW55IGNvbmNlcm5zIHdpdGggcmVzcGVj
dCB0byBhZGRpbmcgYXVkaXQgbWVzc2FnZXMgaW4gbG93IAptZW1vcnkgY29uZGl0aW9ucz8KCj4g
Cj4gUmV2aWV3ZWQtYnk6IE1pbWkgWm9oYXIgPHpvaGFyQGxpbnV4LmlibS5jb20+CgpUaGFua3Mg
TWltaQoKICAtbGFrc2htaQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRp
dEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1hdWRpdA==

