Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F016629C1
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 16:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673277640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PTpYtYawoJQ0Ma8dB18okFS5uStHy/4GB+/zjCoj2t0=;
	b=V+vmGgJFrV2n43xhEvBJTObtAlLsedvu/3zDrKc2pa8rtja6abOjT8LdVDuJA1z7b+o8X6
	wvZhZb1xb9KaBFEEKowWUJd02FF64sOcXhVj/fGnCU8QmYP7KgaSd861LLLfj9QQQtOiuq
	JiKdBoLH5Izsg7N2I01N3IOlvBAWed4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-R-LhckhGNCKw83ia1IzRXA-1; Mon, 09 Jan 2023 10:20:38 -0500
X-MC-Unique: R-LhckhGNCKw83ia1IzRXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F50382C96D;
	Mon,  9 Jan 2023 15:20:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFEEAC16029;
	Mon,  9 Jan 2023 15:20:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 12384194973A;
	Mon,  9 Jan 2023 15:20:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 045081946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 15:11:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4C60492B01; Mon,  9 Jan 2023 15:11:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE95492B00
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 15:11:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81D78857A88
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 15:11:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-0tJBFyFgN7KIpB3nBy6ypA-1; Mon, 09 Jan 2023 10:11:20 -0500
X-MC-Unique: 0tJBFyFgN7KIpB3nBy6ypA-1
Received: by mail-pf1-f182.google.com with SMTP id 200so172672pfx.7;
 Mon, 09 Jan 2023 07:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mbMyQ+Lk6XMV45ZxQEld3vGI2Hm83HoIjGeiP+5YohY=;
 b=nt3aUL+3K8HGD8VhosTYeEqmHAlEKXi2zOojAOqPxdoKCL3gJwYwj35BFVcq+HtWyn
 6KjsVlzTHmtZ9IJKoSlZe2JBUEGMlJ8Cb4kVa8b9Uv/QuJDHAPGWlObh9KmHJYgyI02e
 1ptymf8N10YPC9S6Uz1iKWgd1cOrKaNbHnyF0PE5a6f9sZurPmJTW2ZXysQKslZjsA2N
 TwQ3VdZf4t/Pbs8Ja4X75z/TrDcacF0etIyDIXqQ+NCuc7lTR3A9R2vBSHLIIYC6tr1U
 ouEXQ4wByj8BErqWz2bMzs6YTBneHI6w/p7jUUom4Hm/BLimvAI6y1ocNYmRme6eubUR
 IsUQ==
X-Gm-Message-State: AFqh2krWjEKyYaEZazCz1oKtJ5Xemc5BEM7pvre9AI5NX/buAhpJtS6R
 9clgbCZlYf9lZOZCOn93evqT4a04IYRmUue2Brg=
X-Google-Smtp-Source: AMrXdXtaMXZw+A+awBZWMsLxBBg2VbK1BTjUoNNl6u+Vm395uYoqWXtbYO/zcm6KlM3AUdY2y8deWO0NXh0INgA2vaA=
X-Received: by 2002:a63:f957:0:b0:477:98cc:3d01 with SMTP id
 q23-20020a63f957000000b0047798cc3d01mr3281088pgk.505.1673277078970; Mon, 09
 Jan 2023 07:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
 <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
In-Reply-To: <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 9 Jan 2023 23:11:07 +0800
Message-ID: <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
To: Yann Sionneau <ysionneau@kalray.eu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 09 Jan 2023 15:20:31 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gOSwgMjAyMyBhdCA5OjIxIFBNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBr
YWxyYXkuZXU+IHdyb3RlOgo+Cj4gSGkgSmVmZiwKPgo+IE9uIDEvNy8yMyAwNzoyNSwgSmVmZiBY
aWUgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBXZWQsIEphbiA0LCAyMDIzIGF0IDE6MDEgQU0g
WWFubiBTaW9ubmVhdSA8eXNpb25uZWF1QGthbHJheS5ldT4gd3JvdGU6Cj4gPj4gW3NuaXBdCj4g
Pj4KPiA+PiBBIGt2eCB0b29sY2hhaW4gY2FuIGJlIGJ1aWx0IHVzaW5nOgo+ID4+ICMgaW5zdGFs
bCBkZXBlbmRlbmNpZXM6IHRleGluZm8gYmlzb24gZmxleCBsaWJnbXAtZGV2IGxpYm1wYy1kZXYg
bGlibXBmci1kZXYKPiA+PiAkIGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20va2FscmF5L2J1
aWxkLXNjcmlwdHMKPiA+PiAkIGNkIGJ1aWxkLXNjcmlwdHMKPiA+PiAkIHNvdXJjZSBsYXN0LnJl
ZnMKPiA+PiAkIC4vYnVpbGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPiBJIHdvdWxkIGxpa2UgdG8g
YnVpbGQgdGhlIGt2eC14Z2NjIHRvIGNvbXBpbGUgYW5kIHRlc3QgdGhlIGxpbnV4Cj4gPiBrZXJu
ZWwsIGJ1dCBpdCByZXBvcnRlZCBhIGNvbXBpbGUgZXJyb3IuCj4gPiBJIHdvbmRlciB3aGF0IHZl
cnNpb24gb2YgZ2NjIHlvdSBhcmUgdXNpbmcuCj4gPgo+ID4gTXkgYnVpbGQgZW52aXJvbm1lbnQ6
Cj4gPiBWRVJTSU9OPSIyMC4wNC4yIExUUyAoRm9jYWwgRm9zc2EpIgo+ID4gZ2NjIHZlcnNpb24g
OS4zLjAgKFVidW50dSA5LjMuMC0xN3VidW50dTF+MjAuMDQpCj4gPgo+ID4KPiA+IENvbXBpbGUg
ZXJyb3I6Cj4gPiAkIC4vYnVpbGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPgo+ID4gLi4vLi4vYmlu
dXRpbHMvbGliaWJlcnR5L2ZpYmhlYXAuYzogSW4gZnVuY3Rpb24g4oCYZmliaGVhcF9yZXBsYWNl
X2tleV9kYXRh4oCZOgo+ID4gLi4vLi4vYmludXRpbHMvbGliaWJlcnR5L2ZpYmhlYXAuYzozODoy
NDogZXJyb3I6IOKAmExPTkdfTUlO4oCZIHVuZGVjbGFyZWQKPiA+IChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKPiA+ICAgICAzOCB8ICNkZWZpbmUgRklCSEVBUEtFWV9NSU4gTE9OR19NSU4K
PiA+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPiA+IFtzbmlwXQo+
Cj4gV2hhdCBTSEExIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cyBh
cmUgeW91IHVzaW5nPwoKSSBoYXZlIGV4ZWN1dGVkIHRoZSAic291cmNlIGxhc3QucmVmcyIKCj4g
V2UgYXJlIGJ1aWxkaW5nIG91ciB0b29sY2hhaW4gb24gVWJ1bnR1IDE4LjA0IC8gMjAuMDQgYW5k
IDIyLjA0IHdpdGhvdXQKPiBpc3N1ZXMsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaXQgZG9lcyBu
b3Qgd29yayBmb3IgeW91LCBhbHRob3VnaCBpbmRlZWQKPiB0aGUgZXJyb3IgbG9nIHlvdSBhcmUg
aGF2aW5nIHBvcHMgb3V0IG9uIG15IHNlYXJjaCBlbmdpbmUgYW5kIHNlZW1zIHRvCj4gYmUgc29t
ZSB3ZWxsIGtub3duIGlzc3VlLgoKWWVzLCB0aGVyZSBhcmUgbWFueSBhbnN3ZXJzIG9uIHRoZSB3
ZWIsIGJ1dCBub25lIG9mIHRoZW0gc29sdmUgdGhpcyBwcm9ibGVtLgoKPiBJZiB0aGUgYnVpbGQt
c2NyaXB0IGRvZXMgbm90IHdvcmsgZm9yIHlvdSwgeW91IGNhbiBzdGlsbCB1c2UgdGhlCj4gcHJl
LWJ1aWx0IHRvb2xjaGFpbnMgZ2VuZXJhdGVkIGJ5IHRoZSBHaXRIdWIgYXV0b21hdGVkIGFjdGlv
bnM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRzL3JlbGVhc2VzL3Rh
Zy92NC4xMS4xICgibGF0ZXN0Igo+IG1lYW5zIDIyLjA0KQoKVGhhbmtzLCB0aGlzIGlzIHRoZSBm
aW5hbCBzb2x1dGlvbiA7LSkKCj4KPiBJIGhvcGUgaXQgd2lsbCB3b3JrIGZvciB5b3UuCj4KPiBS
ZWdhcmRzLAo+Cj4gLS0KPgo+IFlhbm4KPgo+Cj4KPgo+CgoKLS0gClRoYW5rcywKSmVmZlhpZQoK
LS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20KaHR0cHM6
Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

