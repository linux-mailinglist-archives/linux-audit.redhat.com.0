Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119D66C21E
	for <lists+linux-audit@lfdr.de>; Mon, 16 Jan 2023 15:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673879046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w/lH+MpheslHBPt/UNAuk6hjPn5HHfrySyxHfPOXLYY=;
	b=BwCHPq6VHx4RGNvyvOKiQc5wcY/qHIEzKpu4Otcd/w7vL2DtDoQtrzDrEZumR31bKco6mq
	eNNiTHcClBPaIF9cPgo/+/egyBWy/sOKmQ7GAK0DCY4yZ9fI10srO06udQA4BvmBGq6TTB
	2NQPMYpWlAUCV/IX2Cvei7uyzcZOnCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-qE8LIkvCPmatrEPYRYzRTw-1; Mon, 16 Jan 2023 09:24:04 -0500
X-MC-Unique: qE8LIkvCPmatrEPYRYzRTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5D88533B6;
	Mon, 16 Jan 2023 14:24:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE2CC492B00;
	Mon, 16 Jan 2023 14:23:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 001F81947062;
	Mon, 16 Jan 2023 14:23:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5F2719465B1 for <linux-audit@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 07:31:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8ED51121315; Mon, 16 Jan 2023 07:31:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A133D1121314
 for <linux-audit@redhat.com>; Mon, 16 Jan 2023 07:31:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8180F3806723
 for <linux-audit@redhat.com>; Mon, 16 Jan 2023 07:31:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-O0YhO9NYOyS-Y56Oom5kRQ-1; Mon, 16 Jan 2023 02:31:25 -0500
X-MC-Unique: O0YhO9NYOyS-Y56Oom5kRQ-1
Received: by mail-pj1-f49.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso6139595pjb.0; 
 Sun, 15 Jan 2023 23:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOOg7H5N+Z63OpUC/u+N5UvkbhcnIUC0AQSISCJusN4=;
 b=NrLJhXqY/8Pt/6fDs6JB7LtVX5kVlIcUua0cLcplOUAtiiGVugS3Qg0NFS5S+/HdRr
 o+Cn5tklnYBaJTSj+GdYkmFuORhMpBMzhCE2lzGyxX4PCVSXAFPaqslf9oX2SULu9KEA
 TZuJBHjg1vWglP5wQYXCxeNkZ8rlTVg+pC4JCcONC8iu9ZGaCEY6G+/OrWqoPTARPOmW
 P4Jt7SAWD3GjtN5KY2NKVKkCkW3DikWJsF1MZftEcaL9HPg5Ll1VKG06sb0yE5YFa854
 d3s9QL55sxPt1AnEuibHcV6qJk8a6E+yg0TzHy1Pks1Ao9EluWKvg4tLD77ZgjKD8qD5
 eJHQ==
X-Gm-Message-State: AFqh2ko8rvrs86wJydsL+3EXKBZeHay2oluzS8KPoCd1I9qOnMPARrTj
 i3ZIOBmmhjYGYyL8x+s3HW66SWte/6yQliCwvMw=
X-Google-Smtp-Source: AMrXdXsHaNFvTcwq7IYjoURTRKB9mLY6RlfohU9xRx/ch1k9FfnZTPFe5NEyMuszQC6sWUU/1ki2k4jRifdInbi8kL8=
X-Received: by 2002:a17:90b:1112:b0:223:dd6f:13b2 with SMTP id
 gi18-20020a17090b111200b00223dd6f13b2mr6617650pjb.56.1673854283697; Sun, 15
 Jan 2023 23:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
 <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
 <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
 <bccad498-3af2-08f1-8264-cf7b438732d3@kalray.eu>
 <CAEr6+EC0SCXLrQ2YNYyCyMK1Z9=3=ajbbLP+RKSsARGsmJO9YA@mail.gmail.com>
In-Reply-To: <CAEr6+EC0SCXLrQ2YNYyCyMK1Z9=3=ajbbLP+RKSsARGsmJO9YA@mail.gmail.com>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 16 Jan 2023 15:31:11 +0800
Message-ID: <CAEr6+EC4e5QsodG_SpTVMBoGfW1GDAgUfBphahgrqy52vXFB+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
To: Yann Sionneau <ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 16 Jan 2023 14:23:44 +0000
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
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gOSwgMjAyMyBhdCAxMTo1MyBQTSBKZWZmIFhpZSA8eGllaHVhbjA5QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiA5LCAyMDIzIGF0IDExOjMwIFBNIFlhbm4gU2lv
bm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3RlOgo+ID4KPiA+IEhpIEplZmYsCj4gPgo+
ID4gT24gMS85LzIzIDE2OjExLCBKZWZmIFhpZSB3cm90ZToKPiA+ID4gT24gTW9uLCBKYW4gOSwg
MjAyMyBhdCA5OjIxIFBNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3Rl
Ogo+ID4gPj4gSGkgSmVmZiwKPiA+ID4+Cj4gPiA+PiBPbiAxLzcvMjMgMDc6MjUsIEplZmYgWGll
IHdyb3RlOgo+ID4gPj4+IEhpLAo+ID4gPj4+Cj4gPiA+Pj4gT24gV2VkLCBKYW4gNCwgMjAyMyBh
dCAxOjAxIEFNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3RlOgo+ID4g
Pj4+PiBbc25pcF0KPiA+ID4+Pj4KPiA+ID4+Pj4gQSBrdnggdG9vbGNoYWluIGNhbiBiZSBidWls
dCB1c2luZzoKPiA+ID4+Pj4gIyBpbnN0YWxsIGRlcGVuZGVuY2llczogdGV4aW5mbyBiaXNvbiBm
bGV4IGxpYmdtcC1kZXYgbGlibXBjLWRldiBsaWJtcGZyLWRldgo+ID4gPj4+PiAkIGdpdCBjbG9u
ZSBodHRwczovL2dpdGh1Yi5jb20va2FscmF5L2J1aWxkLXNjcmlwdHMKPiA+ID4+Pj4gJCBjZCBi
dWlsZC1zY3JpcHRzCj4gPiA+Pj4+ICQgc291cmNlIGxhc3QucmVmcwo+ID4gPj4+PiAkIC4vYnVp
bGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPiA+Pj4gSSB3b3VsZCBsaWtlIHRvIGJ1aWxkIHRoZSBr
dngteGdjYyB0byBjb21waWxlIGFuZCB0ZXN0IHRoZSBsaW51eAo+ID4gPj4+IGtlcm5lbCwgYnV0
IGl0IHJlcG9ydGVkIGEgY29tcGlsZSBlcnJvci4KPiA+ID4+PiBJIHdvbmRlciB3aGF0IHZlcnNp
b24gb2YgZ2NjIHlvdSBhcmUgdXNpbmcuCj4gPiA+Pj4KPiA+ID4+PiBNeSBidWlsZCBlbnZpcm9u
bWVudDoKPiA+ID4+PiBWRVJTSU9OPSIyMC4wNC4yIExUUyAoRm9jYWwgRm9zc2EpIgo+ID4gPj4+
IGdjYyB2ZXJzaW9uIDkuMy4wIChVYnVudHUgOS4zLjAtMTd1YnVudHUxfjIwLjA0KQo+ID4gPj4+
Cj4gPiA+Pj4KPiA+ID4+PiBDb21waWxlIGVycm9yOgo+ID4gPj4+ICQgLi9idWlsZC1rdngteGdj
Yy5zaCBvdXRwdXQKPiA+ID4+Pgo+ID4gPj4+IC4uLy4uL2JpbnV0aWxzL2xpYmliZXJ0eS9maWJo
ZWFwLmM6IEluIGZ1bmN0aW9uIOKAmGZpYmhlYXBfcmVwbGFjZV9rZXlfZGF0YeKAmToKPiA+ID4+
PiAuLi8uLi9iaW51dGlscy9saWJpYmVydHkvZmliaGVhcC5jOjM4OjI0OiBlcnJvcjog4oCYTE9O
R19NSU7igJkgdW5kZWNsYXJlZAo+ID4gPj4+IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
PiA+ID4+PiAgICAgIDM4IHwgI2RlZmluZSBGSUJIRUFQS0VZX01JTiBMT05HX01JTgo+ID4gPj4+
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Cj4gPiA+Pj4gW3NuaXBd
Cj4gPiA+PiBXaGF0IFNIQTEgb2YgaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3Jp
cHRzIGFyZSB5b3UgdXNpbmc/Cj4gPiA+IEkgaGF2ZSBleGVjdXRlZCB0aGUgInNvdXJjZSBsYXN0
LnJlZnMiCj4gPgo+ID4gSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBTSEExIG9mIHRoZSByZXBvIGl0
c2VsZiAoYnVpbGQtc2NyaXB0cykuCj4gPgo+ID4gYGxhc3QucmVmc2AgaXMgYSBzeW1ib2xpYyBs
aW5rIHdoaWNoIGNhbiBwb2ludCB0byBzZXZlcmFsIHJlbGVhc2VzLAo+ID4gZGVwZW5kaW5nIG9u
ICJ3aGVuIiB5b3UgZGlkIHRoZSBjbG9uZS4KPiA+Cj4gPiBJIGFtIGFza2luZyB0aGlzIGJlY2F1
c2Ugd2UgcmVjZW50bHkgcHVibGlzaGVkIG5ldyB0b29sY2hhaW5zLgo+ID4KPiA+IEkgd2FudCB0
byBtYWtlIHN1cmUgd2hpY2ggb25lIHlvdSBhcmUgdHJ5aW5nIHRvIGJ1aWxkLgo+Cj4gVW5mb3J0
dW5hdGVseSBJIGRlbGV0ZWQgdGhpcyByZXBvIGEgZmV3IG1pbnV0ZXMgYmVmb3JlIHlvdSBhc2tl
ZCBtZSA7LSgKPiBCdXQgSSByZW1lbWJlciB0aGF0IEkgY2xvbmVkIHRoaXMgcmVwbyB0d28gZGF5
cyBhZ28uCj4gaXQgc2hvdWxkIGJlOiAgbGFzdC5yZWZzIC0+IHJlZnMvNC4xMS4wLnJlZnMKCkl0
IHNob3VsZCBiZSBteSBvd24gZW52aXJvbm1lbnRhbCBwcm9ibGVtLgpJIHJlaW5zdGFsbGVkIHRo
ZSBzeXN0ZW0gb25jZSBhbmQgaXQgaGFzIGJlZW4gYWJsZSB0byBjb21waWxlIG5vcm1hbGx5IDst
KQoKSW4gdGhlIHBhc3QgZmV3IGRheXMsIEkgaGF2ZSByZXZpZXdlZCBhbG1vc3QgYWxsIHRoZSBj
b2RlcywKd2hpY2ggaXMgdmVyeSBtZWFuaW5nZnVsIGZvciBtZSB0byBsZWFybiwgdGhhbmsgeW91
IHRlYW0uCgoKPgo+ID4gPj4gV2UgYXJlIGJ1aWxkaW5nIG91ciB0b29sY2hhaW4gb24gVWJ1bnR1
IDE4LjA0IC8gMjAuMDQgYW5kIDIyLjA0IHdpdGhvdXQKPiA+ID4+IGlzc3VlcywgSSBkb24ndCB1
bmRlcnN0YW5kIHdoeSBpdCBkb2VzIG5vdCB3b3JrIGZvciB5b3UsIGFsdGhvdWdoIGluZGVlZAo+
ID4gPj4gdGhlIGVycm9yIGxvZyB5b3UgYXJlIGhhdmluZyBwb3BzIG91dCBvbiBteSBzZWFyY2gg
ZW5naW5lIGFuZCBzZWVtcyB0bwo+ID4gPj4gYmUgc29tZSB3ZWxsIGtub3duIGlzc3VlLgo+ID4g
PiBZZXMsIHRoZXJlIGFyZSBtYW55IGFuc3dlcnMgb24gdGhlIHdlYiwgYnV0IG5vbmUgb2YgdGhl
bSBzb2x2ZSB0aGlzIHByb2JsZW0uCj4gPiA+Cj4gPiA+PiBJZiB0aGUgYnVpbGQtc2NyaXB0IGRv
ZXMgbm90IHdvcmsgZm9yIHlvdSwgeW91IGNhbiBzdGlsbCB1c2UgdGhlCj4gPiA+PiBwcmUtYnVp
bHQgdG9vbGNoYWlucyBnZW5lcmF0ZWQgYnkgdGhlIEdpdEh1YiBhdXRvbWF0ZWQgYWN0aW9uczoK
PiA+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cy9yZWxlYXNlcy90
YWcvdjQuMTEuMSAoImxhdGVzdCIKPiA+ID4+IG1lYW5zIDIyLjA0KQo+ID4gPiBUaGFua3MsIHRo
aXMgaXMgdGhlIGZpbmFsIHNvbHV0aW9uIDstKQo+ID4gR29vZCB0byBzZWUgaXQgaGVscGVkIDop
Cj4gPgo+ID4gUmVnYXJkcywKPiA+Cj4gPiAtLQo+ID4KPiA+IFlhbm4KPiA+Cj4gPgo+ID4KPiA+
Cj4gPgo+Cj4KPiAtLQo+IFRoYW5rcywKPiBKZWZmWGllCgoKCi0tClRoYW5rcywKSmVmZlhpZQoK
LS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

