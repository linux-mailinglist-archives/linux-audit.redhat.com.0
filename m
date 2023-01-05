Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75E66077E
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 20:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673035121;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0TJIlqWBeGO2iVjBfDlu43AV520xT2UUnpcwbcBXPfY=;
	b=DKMcB4oikadED4jZ8/5NzyoBpGra6zoML2oDHv/x+ctVg/0unIiy+FbctHz0mktrM66jlI
	bOgSU0xS2IaV8V10iBg4gYS2cw7QDGtDeQaUCDgYJRjZ8rHcqePpNJGO16N3zm3lBcWjcm
	XE8wyH2E0bDIgUmEnRw4/p9kNThaGUA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-56pbqPXONFyuZcmm5g8H-A-1; Fri, 06 Jan 2023 14:58:37 -0500
X-MC-Unique: 56pbqPXONFyuZcmm5g8H-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E64F2A59562;
	Fri,  6 Jan 2023 19:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 643E4492B07;
	Fri,  6 Jan 2023 19:58:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CCCC819459DB;
	Fri,  6 Jan 2023 19:58:26 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E16291946586 for <linux-audit@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 14:20:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3C31492B08; Thu,  5 Jan 2023 14:20:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC092492B07
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 14:20:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 790C9811E6E
 for <linux-audit@redhat.com>; Thu,  5 Jan 2023 14:20:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-KVVsYB79NJufWDsNIvgiNA-1; Thu, 05 Jan 2023 09:20:09 -0500
X-MC-Unique: KVVsYB79NJufWDsNIvgiNA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BEDA61ACA;
 Thu,  5 Jan 2023 14:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A407C433EF;
 Thu,  5 Jan 2023 14:12:40 +0000 (UTC)
Date: Thu, 5 Jan 2023 09:12:38 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
Message-ID: <20230105091238.42bd6e6f@gandalf.local.home>
In-Reply-To: <5b69db0b-9eed-42ce-8e93-4b656022433f@app.fastmail.com>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
 <20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
 <5b69db0b-9eed-42ce-8e93-4b656022433f@app.fastmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Fri, 06 Jan 2023 19:58:25 +0000
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
 Marc =?UTF-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Sebastian Reichel <sre@kernel.org>,
 Marius Gligor <mgligor@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 linux-mm@kvack.org, Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luc Michel <lmichel@kalray.eu>, linux-riscv@lists.infradead.org, Ashley
 Lesdalons <alesdalons@kalray.eu>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Costis <tcostis@kalray.eu>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Borne <jborne@kalray.eu>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>, Samuel Jones <sjones@kalray.eu>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Jean-Christophe Pince <jcpince@gmail.com>, Waiman Long <longman@redhat.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 linux-pm@vger.kernel.org, Yann Sionneau <ysionneau@kalray.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Julian Vetter <jvetter@kalray.eu>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Julien Hascoet <jhascoet@kalray.eu>, Jason Baron <jbaron@akamai.com>, Rob
 Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh
 Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Julien Villette <jvillette@kalray.eu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, Alex Michon <amichon@kalray.eu>,
 linux-perf-users@vger.kernel.org, linux-audit@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Jiri
 Olsa <jolsa@kernel.org>, Kieran Bingham <kbingham@kernel.org>,
 bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 05 Jan 2023 13:05:32 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> >> I did not receive most of the other patches as I'm
> >> not subscribed to all the mainline lists. For future 
> >> submissions, can you add the linux-arch list to Cc for
> >> all patches?  
> >
> > We misused get_maintainers.pl, running it on each patch instead
> > of using it on the whole series. next time every one will be in
> > copy of every patch in the series and including linux-arch.  
> 
> Be careful not to make the list too long though, there is
> usually a limit of 1024 characters for the entire Cc list,
> above this your mails may get dropped by the mailing lists.

It's best to include mailing lists for the entire series, and perhaps
individuals for each patch. As I don't want the entire series just to see
the tracing portion.

-- Steve

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

