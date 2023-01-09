Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043B66282C
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 15:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673273643;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=su4t/Rbcl0pxmyQeDQsL8mX2p+UhATHBUZVoxmvi49E=;
	b=IcAFlhPwpEgLKFYy5wu5SrBUlmpw8ukmGpdyC2fY+UlSP/j2/YPB7ZxWEqAJN/NFeyOn4/
	VTcQuYyzOQXKi7GMtAld5VL+v1oL13P9CxF9OB/ld1QCUR/DcsrP03qav6TdpD81JicviN
	XldFsPn2tDqdajV8fCsIQb4yLDuDiN0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-DCwMsE3EPXivN83FCITMgg-1; Mon, 09 Jan 2023 09:13:52 -0500
X-MC-Unique: DCwMsE3EPXivN83FCITMgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4458857A81;
	Mon,  9 Jan 2023 14:13:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24F452026D76;
	Mon,  9 Jan 2023 14:13:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E5F671947BBE;
	Mon,  9 Jan 2023 14:13:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B0BEB1947B94 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 13:21:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C9452166B2A; Mon,  9 Jan 2023 13:21:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 951982166B29
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 13:21:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7686B85A588
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 13:21:22 +0000 (UTC)
Received: from fx405.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-e65Ke5tmOpmeLlgv4s8TRQ-1; Mon, 09 Jan 2023 08:21:21 -0500
X-MC-Unique: e65Ke5tmOpmeLlgv4s8TRQ-1
Received: from localhost (fx405.security-mail.net [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id DBE62335F2E
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 14:21:18 +0100 (CET)
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id 30474335E90; Mon,  9 Jan
 2023 14:21:18 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id 1E46D335E6D; Mon,  9 Jan
 2023 14:21:17 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id D765927E03FF; Mon,  9 Jan 2023
 14:21:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id B3B4327E03FA; Mon,  9 Jan 2023 14:21:16 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 RFDkxXP_U9mz; Mon,  9 Jan 2023 14:21:16 +0100 (CET)
Received: from [192.168.37.161] (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 46FC927E03F5; Mon,  9 Jan 2023
 14:21:16 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <18db.63bc14cd.171d3.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu B3B4327E03FA
Message-ID: <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
Date: Mon, 9 Jan 2023 14:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
To: Jeff Xie <xiehuan09@gmail.com>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
From: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
X-ALTERMIMEV2_out: done
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 09 Jan 2023 14:13:43 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Marc =?utf-8?b?UG91bGhpw6hz?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Sebastian Reichel <sre@kernel.org>,
 Marius Gligor <mgligor@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 linux-mm@kvack.org, Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luc Michel <lmichel@kalray.eu>, linux-riscv@lists.infradead.org,
 Ashley Lesdalons <alesdalons@kalray.eu>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Samuel Jones <sjones@kalray.eu>, Boqun Feng <boqun.feng@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Julien Hascoet <jhascoet@kalray.eu>, Jason Baron <jbaron@akamai.com>,
 Rob Herring <robh+dt@kernel.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Julien Villette <jvillette@kalray.eu>,
 Jules Maselbas <jmaselbas@kalray.eu>, Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, Alex Michon <amichon@kalray.eu>,
 linux-perf-users@vger.kernel.org, linux-audit@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>,
 Jiri Olsa <jolsa@kernel.org>, Kieran Bingham <kbingham@kernel.org>,
 bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-us
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgSmVmZiwKCk9uIDEvNy8yMyAwNzoyNSwgSmVmZiBYaWUgd3JvdGU6Cj4gSGksCj4KPiBPbiBX
ZWQsIEphbiA0LCAyMDIzIGF0IDE6MDEgQU0gWWFubiBTaW9ubmVhdSA8eXNpb25uZWF1QGthbHJh
eS5ldT4gd3JvdGU6Cj4+IFtzbmlwXQo+Pgo+PiBBIGt2eCB0b29sY2hhaW4gY2FuIGJlIGJ1aWx0
IHVzaW5nOgo+PiAjIGluc3RhbGwgZGVwZW5kZW5jaWVzOiB0ZXhpbmZvIGJpc29uIGZsZXggbGli
Z21wLWRldiBsaWJtcGMtZGV2IGxpYm1wZnItZGV2Cj4+ICQgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0
aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cwo+PiAkIGNkIGJ1aWxkLXNjcmlwdHMKPj4gJCBz
b3VyY2UgbGFzdC5yZWZzCj4+ICQgLi9idWlsZC1rdngteGdjYy5zaCBvdXRwdXQKPiBJIHdvdWxk
IGxpa2UgdG8gYnVpbGQgdGhlIGt2eC14Z2NjIHRvIGNvbXBpbGUgYW5kIHRlc3QgdGhlIGxpbnV4
Cj4ga2VybmVsLCBidXQgaXQgcmVwb3J0ZWQgYSBjb21waWxlIGVycm9yLgo+IEkgd29uZGVyIHdo
YXQgdmVyc2lvbiBvZiBnY2MgeW91IGFyZSB1c2luZy4KPgo+IE15IGJ1aWxkIGVudmlyb25tZW50
Ogo+IFZFUlNJT049IjIwLjA0LjIgTFRTIChGb2NhbCBGb3NzYSkiCj4gZ2NjIHZlcnNpb24gOS4z
LjAgKFVidW50dSA5LjMuMC0xN3VidW50dTF+MjAuMDQpCj4KPgo+IENvbXBpbGUgZXJyb3I6Cj4g
JCAuL2J1aWxkLWt2eC14Z2NjLnNoIG91dHB1dAo+Cj4gLi4vLi4vYmludXRpbHMvbGliaWJlcnR5
L2ZpYmhlYXAuYzogSW4gZnVuY3Rpb24g4oCYZmliaGVhcF9yZXBsYWNlX2tleV9kYXRh4oCZOgo+
IC4uLy4uL2JpbnV0aWxzL2xpYmliZXJ0eS9maWJoZWFwLmM6Mzg6MjQ6IGVycm9yOiDigJhMT05H
X01JTuKAmSB1bmRlY2xhcmVkCj4gKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAz
OCB8ICNkZWZpbmUgRklCSEVBUEtFWV9NSU4gTE9OR19NSU4KPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+Cj4gW3NuaXBdCgpXaGF0IFNIQTEgb2YgaHR0cHM6Ly9naXRo
dWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRzIGFyZSB5b3UgdXNpbmc/CgpXZSBhcmUgYnVpbGRp
bmcgb3VyIHRvb2xjaGFpbiBvbiBVYnVudHUgMTguMDQgLyAyMC4wNCBhbmQgMjIuMDQgd2l0aG91
dCAKaXNzdWVzLCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IGRvZXMgbm90IHdvcmsgZm9yIHlv
dSwgYWx0aG91Z2ggaW5kZWVkIAp0aGUgZXJyb3IgbG9nIHlvdSBhcmUgaGF2aW5nIHBvcHMgb3V0
IG9uIG15IHNlYXJjaCBlbmdpbmUgYW5kIHNlZW1zIHRvIApiZSBzb21lIHdlbGwga25vd24gaXNz
dWUuCgpJZiB0aGUgYnVpbGQtc2NyaXB0IGRvZXMgbm90IHdvcmsgZm9yIHlvdSwgeW91IGNhbiBz
dGlsbCB1c2UgdGhlIApwcmUtYnVpbHQgdG9vbGNoYWlucyBnZW5lcmF0ZWQgYnkgdGhlIEdpdEh1
YiBhdXRvbWF0ZWQgYWN0aW9uczogCmh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2Ny
aXB0cy9yZWxlYXNlcy90YWcvdjQuMTEuMSAoImxhdGVzdCIgCm1lYW5zIDIyLjA0KQoKSSBob3Bl
IGl0IHdpbGwgd29yayBmb3IgeW91LgoKUmVnYXJkcywKCi0tIAoKWWFubgoKCgoKCi0tCkxpbnV4
LWF1ZGl0IG1haWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1h
bi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK

