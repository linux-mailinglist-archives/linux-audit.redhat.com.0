Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CB21D154C61
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 20:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581018014;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+W3CueRZeXNxHOfz/VSO8CcfDP4zxz6ApCBBypc8PvQ=;
	b=FX5UW0oSysswVHkAvRxhsqPVqcXvgh0cXRX8g4MOI+NIGh55B/MRt5HS+/ockKLHvwsCdn
	ubTzleh4I7qy07ByLImyLPtuJdJxfE5+z3gvE72rZx6Q24eDZUgfkmc8tzLoXhNeFr6JL7
	5ORdRwyH6NqGyAizE5s1qYmHybo693o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-1WJID90sMNK1_H13EzAk5w-1; Thu, 06 Feb 2020 14:40:12 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BFED8010EF;
	Thu,  6 Feb 2020 19:40:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE260790FD;
	Thu,  6 Feb 2020 19:40:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AF991803C32;
	Thu,  6 Feb 2020 19:39:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016Jdn0H007046 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 14:39:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 77BFA1006ECA; Thu,  6 Feb 2020 19:39:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 737DF101F0AB
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 19:39:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64F5E803B21
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 19:39:47 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-M41HJZ1NMMay66fR9W1tpQ-1; Thu, 06 Feb 2020 14:39:44 -0500
Received: by mail-pl1-f195.google.com with SMTP id d9so2739099plo.11
	for <linux-audit@redhat.com>; Thu, 06 Feb 2020 11:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=AVYpUbdFB+gaCKKJfJ8IatRwnqehZPpkRPm7ixRSBg4=;
	b=pcg/jegkVXAPVWc5EpeT1qxsE6EOTaZGTk0pKo6jcQJlKfWb4A3qCIvAe/ufZq4eEE
	E2VM46uwloxzJpWkijs1dZjFG5HFX22BJ5ogjZUWJL6vr83xFr6KHpUibWeIJMT/GK6R
	seN2V4SFyBWhtMpA+4+JlO9nzUTuU+xe4qbS6XciVecIuLEfJgevfe8R9QRNThIp44ji
	0eJNnHnHlN5ldxKre0tn3pf73Uz3JCO14QCNCNnTFsd9eNh4loDUaw2mo/KevVrRaw0y
	d9MZHWOXtgDe86u35WYRw9Dpaj1piWYUlZyFO1USfFBg/PD9V8xJg/SPEYQYBuoJX7ie
	Bw1A==
X-Gm-Message-State: APjAAAUBjR8Atn6Ae/+GVlV4dLAMyfx/sJVv2peI8egNwxyCOuHLhEl1
	sw243FFW26TpeClRNEapBfF2hKW0ttc=
X-Google-Smtp-Source: APXvYqwjTjW+zkuihuA6wwlyK5PAG0npCUSCNFQWMPI/w/UmxqPUYfeba3HFd0GKnMrMjr0bbBTPgg==
X-Received: by 2002:a17:902:a416:: with SMTP id
	p22mr5611821plq.107.1581017983059; 
	Thu, 06 Feb 2020 11:39:43 -0800 (PST)
Received: from [192.168.0.137] ([216.158.248.67])
	by smtp.gmail.com with ESMTPSA id
	d14sm195852pfq.117.2020.02.06.11.39.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Feb 2020 11:39:42 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
From: Lenny Bruzenak <lenny@magitekltd.com>
To: Orion Poplawski <orion@nwra.com>, linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
	<7f299e8c-6888-91eb-8feb-91e37fb87fd2@magitekltd.com>
	<8010cdd2-468b-ac87-54f1-2846baf28d28@nwra.com>
	<57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
Message-ID: <9e2fb605-4444-ba45-b6b4-96620e88fa20@magitekltd.com>
Date: Thu, 6 Feb 2020 12:39:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <57c2b1a1-5406-4d77-9dc5-ad6c99b987a8@magitekltd.com>
Content-Language: en-US
X-MC-Unique: M41HJZ1NMMay66fR9W1tpQ-1
X-MC-Unique: 1WJID90sMNK1_H13EzAk5w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 016Jdn0H007046
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMi82LzIwIDExOjMzIEFNLCBMZW5ueSBCcnV6ZW5hayB3cm90ZToKCj4gT24gMi82LzIwIDEx
OjEyIEFNLCBPcmlvbiBQb3BsYXdza2kgd3JvdGU6Cj4KPj4gRG9lc24ndCBzZWVtIG11Y2ggYmV0
dGVyOgo+Pgo+PiB0eXBlPVBST0NUSVRMRSBtc2c9YXVkaXQoMDIvMDYvMjAyMCAxMDo1ODoyMy42
MjY6MTE5NjMxKSA6IAo+PiBwcm9jdGl0bGU9L2Jpbi9iYXNoCj4+IC91c3IvYmluL3RodW5kZXJi
aXJkCj4+IHR5cGU9U1lTQ0FMTCBtc2c9YXVkaXQoMDIvMDYvMjAyMCAxMDo1ODoyMy42MjY6MTE5
NjMxKSA6IGFyY2g9eDg2XzY0Cj4+IHN5c2NhbGw9ZnRydW5jYXRlIHN1Y2Nlc3M9eWVzIGV4aXQ9
MCBhMD0weDRhIGExPTB4MjggYTI9MHg3ZjFlNDE2MDAwMTgKPj4gYTM9MHhmZmZmZmUwMCBpdGVt
cz0wIHBwaWQ9MjQ1MSBwaWQ9MzU2MSBhdWlkPVVTRVIgdWlkPVVTRVIgZ2lkPVVTRVIgCj4+IGV1
aWQ9VVNFUgo+PiBzdWlkPVVTRVIgZnN1aWQ9VVNFUiBlZ2lkPVVTRVIgc2dpZD1VU0VSIGZzZ2lk
PVVTRVIgdHR5PShub25lKSBzZXM9MQo+PiBjb21tPXRodW5kZXJiaXJkIGV4ZT0vdXNyL2xpYjY0
L3RodW5kZXJiaXJkL3RodW5kZXJiaXJkCj4+IHN1Ymo9dW5jb25maW5lZF91OnVuY29uZmluZWRf
cjp1bmNvbmZpbmVkX3Q6czAtczA6YzAuYzEwMjMgCj4+IGtleT13YXRjaGVkX3VzZXJzCj4+Cj4+
IFdoeSBubyBQQVRIIGVudHJ5P8KgIEkgaGF2ZSB0aGVtIGZvciB0aGluZ3MgbGlrZSBvcGVuOgo+
Cj4KPiBUaGUga2VybmVsIGd1eXMgY2FuIHByb2JhYmx5IGFuc3dlciB0aGlzIGFjY3VyYXRlbHku
Cj4KPiBNeSBndWVzcyBpcyB0aGF0IGJlY2F1c2Ugd2l0aCBvcGVuLCB0aGUgcGF0aCBtdXN0IGJl
IHZhbGlkYXRlZCwgYnV0IAo+IGZ0cnVuY2F0ZSB3b3JrcyBvbiBhIGZpbGUgZGVzY3JpcHRvcjsg
bWF5YmUgZ2V0cyBubyBwYXRoIHZhbGlkYXRpb24uCgoKSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IG9u
IHRoZSBzdXJmYWNlIGF0IGxlYXN0IGl0IHNlZW1zIGluY29uc2lzdGVudCB0byAKaGF2ZSBhIFBB
VEggcmVjb3JkIHdpdGggZmNob3duIChoYXZpbmcsIGFzIHlvdSBzYWlkLCB0aGUgaW5vZGUgbnVt
YmVyIGF0IApsZWFzdCkgYnV0IG5vbmUgd2l0aCBmdHJ1bmNhdGUuCgpMQ0IKCi0tIApMQyBCcnV6
ZW5hawpNYWdpdGVrTFRECgoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0
QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWF1ZGl0

