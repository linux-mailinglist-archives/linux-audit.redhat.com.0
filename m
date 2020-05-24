Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3CADC1DFF5F
	for <lists+linux-audit@lfdr.de>; Sun, 24 May 2020 16:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590330636;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IvN7nTSxV1X6TuHMnsDlfPUjTfMtsP5FKr1wfioHBxM=;
	b=LSz2KlhUjc9IP5liTJzTaBIheKfAcZwsOVv9S144oCQMbBg9Oy/DNtZ35zvTimdLY1Uoy5
	kObRUKoKdAW68UJaV8NjcP2PC7lyRKGpj802h9ETQaLquRtBV+wFGFmW4CBMmrkCicXbZH
	/TNYUeDQXqErZANytHV/clgAWzgTpd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4Ion9s8pMa2doWeUisd5kA-1; Sun, 24 May 2020 10:30:34 -0400
X-MC-Unique: 4Ion9s8pMa2doWeUisd5kA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0984800688;
	Sun, 24 May 2020 14:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FEA160BF3;
	Sun, 24 May 2020 14:30:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8042D1809547;
	Sun, 24 May 2020 14:30:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04O8Bksq030446 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 04:11:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 503252166BA0; Sun, 24 May 2020 08:11:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A982166B27
	for <linux-audit@redhat.com>; Sun, 24 May 2020 08:11:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97FEB8007CB
	for <linux-audit@redhat.com>; Sun, 24 May 2020 08:11:39 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-503-X8e4VdyNPUGrnbZQpAxSJA-1; Sun, 24 May 2020 04:11:34 -0400
X-MC-Unique: X8e4VdyNPUGrnbZQpAxSJA-1
Received: by mail-pl1-f195.google.com with SMTP id k22so6246350pls.10;
	Sun, 24 May 2020 01:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3HmigCjALU51rYyyBGLBKoAkAQrHtdUuG74Co9AoT2k=;
	b=JTVi2H1mXXfDjGdZlgATk8vLeKFg4qwo8kp80gsoW4GG62OBVw/zinj5uqJVFzBTGc
	GRiX12K3oK+8pqjyTZHzG1xTD2lGQsJJMEqwlGOD4wB7Bg/4obVZ6DwZILOnw+8rHTVb
	sXzMfJ7L8IwlnxxCyv7OKqB8X4xJevHcJuRD6Xv1HyH9ffeD6pJ9ebAdUbVIZdkGectT
	P7QIx7/1Tl5oSrE4ArOLSfBeT7rcn1VBt+CTY9iIn6DEvE+A7pD1F9BXjLkaj1xHTg1m
	mqacJ4eu2AQH610F9DvQIxMCNJVFii5M+I7TiHVThgEj3pcii1RLOdacVQmtdwbYeGkT
	5JvQ==
X-Gm-Message-State: AOAM533T4UA0mC3nwSm3EveDlqqSLKhXIxmr6v9FHNCpeQV1IwxdDqyA
	BfTZfWa0XV2eSWSqYt+KByE/oi+poMJJFg==
X-Google-Smtp-Source: ABdhPJxZfKElYBNI4glOcgWKrPyJxs5PiTsJpx+QFxqGsjUJty7CXioEENo2hycw40fd49jQga2ajg==
X-Received: by 2002:a17:90a:8989:: with SMTP id
	v9mr14838930pjn.180.1590307892183; 
	Sun, 24 May 2020 01:11:32 -0700 (PDT)
Received: from workstation-LAP.localdomain ([103.87.57.241])
	by smtp.gmail.com with ESMTPSA id
	p190sm10520227pfp.207.2020.05.24.01.11.23
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 May 2020 01:11:31 -0700 (PDT)
Date: Sun, 24 May 2020 13:41:17 +0530
From: Amol Grover <frextrite@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, James Morris <jamorris@linux.microsoft.com>,
	Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
	David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH 1/3 RESEND] sched: Remove __rcu annotation from cred
	pointer
Message-ID: <20200524081117.GA29@workstation-LAP.localdomain>
References: <20200402055640.6677-1-frextrite@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200402055640.6677-1-frextrite@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sun, 24 May 2020 10:29:55 -0400
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
	Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
	linux-audit@redhat.com, Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> task_struct::cred (subjective credentials) is *always* used
> task-synchronously, hence, does not require RCU semantics.
> 
> task_struct::real_cred (objective credentials) can be used in
> RCU context and its __rcu annotation is retained.
> 
> However, task_struct::cred and task_struct::real_cred *may*
> point to the same object, hence, the object pointed to by
> task_struct::cred *may* have RCU delayed freeing.
> 
> Suggested-by: Jann Horn <jannh@google.com>
> Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Hello everyone,

Could you please go through patches 1/3 and 2/3 and if deemed OK, give
your acks. I sent the original patch in beginning of February (~4 months
back) and resent the patches again in beginning of April due to lack of
traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
resend patch. However these 2 patches still remain. I'd really
appreciate if someone reviewed them.

Thanks
Amol

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

