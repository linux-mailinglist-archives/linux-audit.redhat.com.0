Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9AF1F18CD
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jun 2020 14:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591619564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xK4nSTxadHC5+ylALx2efL7yQnIH+SOYn7KgP4vf8wI=;
	b=Vbcbti7bGjCpjtZJKSrl1EQT/m3UhXIsTR8l0t6ywyS4w+Wv6emslTY8oDMXbeZXbni4j5
	TLEn78igpCV+16J4SJFpOHhsfu/4E1EADU6iCeX9x1wy4/1lrsc/m1ZrJ2nT2ju5BYSKMX
	/H0B4+uNKhyzqKcQUSShcchqFdNNpnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-eIDug4kpOc-nTPeAOnRdww-1; Mon, 08 Jun 2020 08:32:42 -0400
X-MC-Unique: eIDug4kpOc-nTPeAOnRdww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1F20100A8E9;
	Mon,  8 Jun 2020 12:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8194460C47;
	Mon,  8 Jun 2020 12:32:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CB641809557;
	Mon,  8 Jun 2020 12:32:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0575aWXb024914 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 7 Jun 2020 01:36:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B0F92166B28; Sun,  7 Jun 2020 05:36:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 872832166B27
	for <linux-audit@redhat.com>; Sun,  7 Jun 2020 05:36:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9846180CDB0
	for <linux-audit@redhat.com>; Sun,  7 Jun 2020 05:36:28 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-180-XnL00ZQhPpe9UR_HgW2WZg-1;
	Sun, 07 Jun 2020 01:36:24 -0400
X-MC-Unique: XnL00ZQhPpe9UR_HgW2WZg-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 94BBF20B717B;
	Sat,  6 Jun 2020 22:36:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 94BBF20B717B
Subject: Re: result logged in integrity audit message
To: Mimi Zohar <zohar@linux.ibm.com>
References: <4c41ce1e-3f97-5b14-8152-5411a3debb57@linux.microsoft.com>
	<1591494710.4615.49.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <d576452d-d894-aa14-be5d-4327c5d7cd53@linux.microsoft.com>
Date: Sat, 6 Jun 2020 22:36:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591494710.4615.49.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0575aWXb024914
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 08:32:21 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi82LzIwIDY6NTEgUE0sIE1pbWkgWm9oYXIgd3JvdGU6Cgo+IEhpIExha3NobWksCj4gCj4g
VGhlIGNvbW1pdCBtZXNzYWdlIHByb3ZpZGVzIGFuIGV4cGxhbmF0aW9uLiDCoExvb2sgYXQgYjBk
NWRlNGQ1ODgwICgiSU1BOiBmaXgKPiBhdWRpdCByZXMgZmllbGQgdG8gaW5kaWNhdGUgMSBmb3Ig
c3VjY2VzcyBhbmQgMCBmb3IgZmFpbHVyZSIpLgoKVGhhbmtzIGZvciB0aGUgaW5mbyBNaW1pLgoK
SWYgdGhpcyBmdW5jdGlvbiBsb2dzIHRoZSAicmVzdWx0IiBwYXJhbWV0ZXIgYXMgcGFzc2VkIGJ5
IHRoZSBjYWxsZXIsIAp0aGUgYXVkaXQgbWVzc2FnZSBjb3VsZCBiZSB2ZXJ5IGhlbHBmdWwgd2hl
biB0cmlhZ2luZyBmYWlsdXJlcy4KQnV0IEkgZ3Vlc3MgY2hhbmdpbmcgdGhpcyBub3cgd291bGQg
Y2F1c2UgcmVncmVzc2lvbiBpbiBjb21wb25lbnRzIHRoYXQgCmV4cGVjdCBvbmx5IDAgb3IgMSBp
biB0aGUgInJlcyIgZmllbGQgaW4gYW4gYXVkaXQgbWVzc2FnZS4KCnRoYW5rcywKICAtbGFrc2ht
aQoKCi0tCkxpbnV4LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdA==

