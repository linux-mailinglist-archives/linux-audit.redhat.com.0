Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 059EC142EB4
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 16:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579533856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dTAlFe5v/GLFny8cCpHIzsbtEjbNIgQ85/iXWVWcaoU=;
	b=XfqbwX6PCPTdUcFc2cw2MHQsVjBqUp3my0gjH7d3kbm0yue8//lefo5lOlCW0ou8iVVGfO
	jlgrRFFaIlZEoax51+U7Zh+oA/MLVEWRXlx89143q7Womt7FnwY3d/M1h4IkbO9SUftQxV
	vOyyUU+58hXgp+X8Wp8wpcxEd71uZ0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-B1in4iEUN0aHAK7BsnwG6A-1; Mon, 20 Jan 2020 10:24:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21BC3107ACC4;
	Mon, 20 Jan 2020 15:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F174C48;
	Mon, 20 Jan 2020 15:24:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68C4981974;
	Mon, 20 Jan 2020 15:24:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KFK60J020181 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:20:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 39EA41102E20; Mon, 20 Jan 2020 15:20:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 348E11104E8C
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:20:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB854800146
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:20:03 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-240-hxWBQ_RxMki6iJ4Re801Gg-1; Mon, 20 Jan 2020 10:20:02 -0500
Received: by mail-vk1-f196.google.com with SMTP id u6so8620649vkn.13
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 07:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=o7hHndvqFemkjH8pGY3HKFhDwNqRyTPmBsfXUR9Q4xM=;
	b=FCjgPcGzuePkrws75E7D+9l1ejYtt5CjCoMSDfPELUc+HrVC6/d6Tw5Y2smRkTHsVW
	zIdIajO2C6SdmXSA7N4qF/8sfF1KyTXb/w4b/gHaucEeXT4K+8Ar9i5YqGc0u0RJTniU
	iOyayKrctmhNjkX38i4/VpLA0t/tuynaeLwkMQuTGqusmPXBeRhnT1X6stL0q04dm0yf
	N4t7k8Io3aWZH8pMhy5cXszwVjiyyQNq0AKjpfgPCpNAShO6+J6AL+9sM6pl/yZ8Pm3U
	rZWP57na/uhvw6vtDCPnh4KqLpdNdStNRMCjWWCwyQ4Fvsw4bc75b4bfnl0CteOj5qdu
	OAzQ==
X-Gm-Message-State: APjAAAW1Cz2/EqnQH+0mZd2ZPa+OABIffeXBM8jFV/X/HsghS/rJP22T
	iRGZ0DWExL674cCJ0qf4/s2z4YOFs1g=
X-Google-Smtp-Source: APXvYqxWsy5uMe20k3+TsQhAkC9vFh1No1Q2PVLC3d7FqUYllmjAvsOLCOSpLBXlUw1wIHEsAkFVxQ==
X-Received: by 2002:a1f:252:: with SMTP id 79mr77568vkc.96.1579533601350;
	Mon, 20 Jan 2020 07:20:01 -0800 (PST)
Received: from [192.168.1.55] (c-73-217-142-143.hsd1.sc.comcast.net.
	[73.217.142.143]) by smtp.gmail.com with ESMTPSA id
	g26sm9929740vkl.16.2020.01.20.07.20.00 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 07:20:01 -0800 (PST)
Subject: Re: Duplicate settings?
To: linux-audit@redhat.com
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
	<7256033.AoGtHsJfsT@x2>
	<faddae2c-ba8b-2061-55b0-9f3eaab93c87@gmail.com>
	<29812992.164tRMTlZt@x2>
From: Leam Hall <leamhall@gmail.com>
Message-ID: <bb281668-ee20-5c23-684e-5e397136956c@gmail.com>
Date: Mon, 20 Jan 2020 10:19:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <29812992.164tRMTlZt@x2>
Content-Language: en-US
X-MC-Unique: hxWBQ_RxMki6iJ4Re801Gg-1
X-MC-Unique: B1in4iEUN0aHAK7BsnwG6A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00KFK60J020181
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jan 2020 10:24:04 -0500
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

T24gMS8yMC8yMCAxMDoxNCBBTSwgU3RldmUgR3J1YmIgd3JvdGU6Cj4gT24gTW9uZGF5LCBKYW51
YXJ5IDIwLCAyMDIwIDEwOjA0OjI0IEFNIEVTVCBMZWFtIEhhbGwgd3JvdGU6Cj4+IE9uIDEvMjAv
MjAgOTozNyBBTSwgU3RldmUgR3J1YmIgd3JvdGU6Cj4+PiBPbiBNb25kYXksIEphbnVhcnkgMjAs
IDIwMjAgOToyNDo1NiBBTSBFU1QgTGVhbSBIYWxsIHdyb3RlOgo+Pj4+IElmIC9ldGMvYXVkaXQv
YXVkaXRkLmNvbmYgZW5jb3VudGVycyBjb25mbGljdGluZyBkdXBsaWNhdGUgc2V0dGluZ3MsCj4+
Pj4gd2hhdCBoYXBwZW5zPyBUYWtlcyB0aGUgZmlyc3QsIHRha2VzIHRoZSBsYXN0LCBvciB3aGF0
PyBGb3IgZXhhbXBsZToKPj4+Pgo+Pj4+IHNwYWNlX2xlZnQgPSAyNQo+Pj4+IHNwYWNlX2xlZnQg
PSAxMDAKPj4+Cj4+PiBJdCBvdmVyd3JpdGVzIHRoZSBmaXJzdCB2YWx1ZSB3aXRoIHRoZSBzZWNv
bmQgb25lLiBZb3UgY2FuIGFsc28gcnVuOgo+Pj4KPj4+ICMgc2VydmljZSBhdWRpdGQgc3RhdGUK
Pj4+Cj4+PiB0byBzZWUgd2hhdCB0aGUgY3VycmVudCB2YWx1ZSBpcyBpZiB5b3VyIGF1ZGl0IGRh
ZW1vbiBpcyBzb21ld2hhdCByZWNlbnQuCj4+Pgo+Pj4gLVN0ZXZlCj4+Cj4+IEhleSBTdGV2ZSwg
YSBmb2xsb3cgdXAuIElzIHRoZSBtYW4gcGFnZSBmb3IgYXVkaXRkLmNvbmYgd3Jvbmc/IE15IGF1
ZGl0ZAo+PiBmYWlsZWQgdG8gc3RhcnQgd2hlbiBnaXZpbmcgc3BhY2VfbGVmdCB3aXRoIGEgJyUn
IHNpZ24uCj4gCj4gVXN1YWxseSBpdCB3cml0ZXMgdGhlIHJlYXNvbiB3aHkgaW4gc3lzbG9nLiBE
b2VzIGl0IHNheSBhbnl0aGluZyB0aGVyZT8KPiAKPiAtU3RldmUKCkkgZG9uJ3QgZ3JvayBzeXN0
ZW1kLCBzbyBoZXJlJ3MgdGhlIHdob2xlIHJlc3BvbnNlOgoKUmVkaXJlY3RpbmcgdG8gL2Jpbi9z
eXN0ZW1jdGwgc3RhdHVzIGF1ZGl0ZC5zZXJ2aWNlCuKXjyBhdWRpdGQuc2VydmljZSAtIFNlY3Vy
aXR5IEF1ZGl0aW5nIFNlcnZpY2UKICAgIExvYWRlZDogbG9hZGVkICgvdXNyL2xpYi9zeXN0ZW1k
L3N5c3RlbS9hdWRpdGQuc2VydmljZTsgZW5hYmxlZDsgCnZlbmRvciBwcmVzZXQ6IGVuYWJsZWQp
CiAgICBBY3RpdmU6IGZhaWxlZCAoUmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIE1vbiAyMDIwLTAx
LTIwIDA5OjI3OjM3IApFU1Q7IDE5bWluIGFnbwogICAgICBEb2NzOiBtYW46YXVkaXRkKDgpCiAg
ICAgICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1hdWRpdC9hdWRpdC1kb2N1bWVudGF0
aW9uCiAgIFByb2Nlc3M6IDI2OTUgRXhlY1N0YXJ0PS9zYmluL2F1ZGl0ZCAoY29kZT1leGl0ZWQs
IHN0YXR1cz02KQoKSmFuIDIwIDA5OjI3OjM2IGxlYW1fYzcgc3lzdGVtZFsxXTogU3RhcnRpbmcg
U2VjdXJpdHkgQXVkaXRpbmcgU2VydmljZS4uLgpKYW4gMjAgMDk6Mjc6MzcgbGVhbV9jNyBhdWRp
dGRbMjY5NV06IFZhbHVlIDI1JSBzaG91bGQgb25seSBiZSBudW1iZXJzIC0gCmxpbmUgMjAKSmFu
IDIwIDA5OjI3OjM3IGxlYW1fYzcgYXVkaXRkWzI2OTVdOiBUaGUgYXVkaXQgZGFlbW9uIGlzIGV4
aXRpbmcuCkphbiAyMCAwOToyNzozNyBsZWFtX2M3IHN5c3RlbWRbMV06IGF1ZGl0ZC5zZXJ2aWNl
OiBjb250cm9sIHByb2Nlc3MgCmV4aXRlZCwgY29kZT1leGl0ZWQgc3RhdHVzPTYKSmFuIDIwIDA5
OjI3OjM3IGxlYW1fYzcgc3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0YXJ0IFNlY3VyaXR5IEF1ZGl0
aW5nIApTZXJ2aWNlLgpKYW4gMjAgMDk6Mjc6MzcgbGVhbV9jNyBzeXN0ZW1kWzFdOiBVbml0IGF1
ZGl0ZC5zZXJ2aWNlIGVudGVyZWQgZmFpbGVkIApzdGF0ZS4KSmFuIDIwIDA5OjI3OjM3IGxlYW1f
Yzcgc3lzdGVtZFsxXTogYXVkaXRkLnNlcnZpY2UgZmFpbGVkLgoKCgotLQpMaW51eC1hdWRpdCBt
YWlsaW5nIGxpc3QKTGludXgtYXVkaXRAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQ=

