Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00756655228
	for <lists+linux-audit@lfdr.de>; Fri, 23 Dec 2022 16:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671809896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bVJO7ODqo2SmAo79Asb3wQOMa5hB0PjkpuJaBL3RhXw=;
	b=cQXgZfkDd96+YdAucEl1AnX/whCIWufHApjnZWIkG20af7Imz8IODJvK4cXSNorXhb3dk5
	k/VEk7D1wL68I6k080fHR7OGakh+8B2zn4nZrp+80PuHq0JCoVq6gJi4rcLkN10MZW6cwr
	29BbwCKpt4raO3rvyl4SwVKB/EblZvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-TkidtMFoMu2GK7wT5Eq9uA-1; Fri, 23 Dec 2022 10:38:12 -0500
X-MC-Unique: TkidtMFoMu2GK7wT5Eq9uA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26CB885A588;
	Fri, 23 Dec 2022 15:38:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 060CF492C14;
	Fri, 23 Dec 2022 15:38:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 869341946A40;
	Fri, 23 Dec 2022 15:38:08 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B217519465B1 for <linux-audit@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 15:38:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9111953A0; Fri, 23 Dec 2022 15:38:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8930C51FF
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 15:38:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A2AA3804067
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 15:38:07 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-ttRA6sQbO6iiDeVBL49big-1; Fri, 23 Dec 2022 10:38:05 -0500
X-MC-Unique: ttRA6sQbO6iiDeVBL49big-1
Received: by mail-pg1-f172.google.com with SMTP id d10so3509204pgm.13
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 07:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwr3WJAl1hrE0J615eHKg41VfEAiCJKmxmlGfLHaFD4=;
 b=PWAfdm9b+mK6FGjEJforOEdUigckLGBnh3PrxJmbcYvB5fsWWIX6Sccs42aj7KwzW7
 dCFIr7Y/Wt3KWooURazI3KDOi34rLI/n+/dbdTKSmoucm9y8P5Lq7S29DpmUUKi5ya0L
 noqAKkFdYL8AYTnntzMRTDZ+XXBQWvX/IgmU/Y62bp16GAfPsHR8DcUMW2o35Ym9MFQh
 OLYcwME7WfXhhnnRv/v2SNPy6wLaq5JQ+hj45GawkYFt2FBRg4CfsvhEjJqmrTyfA81s
 SX9ToBJD65tA82bUgHLspcDkIusSc2Q6eCaaNWY2u954eX5xUGfgFsq/mOTdShKLw7KK
 pNBA==
X-Gm-Message-State: AFqh2koJ7Womaj2RhTIEhBAf7tfgloTNIdCE6XBXGPIrS/dgK1z7JVxD
 Yo7s4cTPm6NBxb4wOfwkaDMlTH2iYP+zPV7b23Q4
X-Google-Smtp-Source: AMrXdXvsbCISQ6sfWB9Cm3C5Nyjfd+JWDETRw9Wwgd5yx0f+RYwGljMFbOaeOCGMv3dlFzmwtgO9VsubX4EOyokrB54=
X-Received: by 2002:a05:6a00:1f1a:b0:576:af2d:4c5f with SMTP id
 be26-20020a056a001f1a00b00576af2d4c5fmr632594pfb.23.1671809884330; Fri, 23
 Dec 2022 07:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
 <Y6TmLyDTY/a20Zq4@krava>
In-Reply-To: <Y6TmLyDTY/a20Zq4@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 23 Dec 2022 10:37:53 -0500
Message-ID: <CAHC9VhSMn5Zunh7JzUmjtBqDhytC0ZCG-7xKEFiMjQyP7YMacw@mail.gmail.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
To: Jiri Olsa <olsajiri@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, sdf@google.com,
 Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 6:20 PM Jiri Olsa <olsajiri@gmail.com> wrote:
>
> On Thu, Dec 22, 2022 at 02:03:41PM -0500, Paul Moore wrote:
> > On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> > > On 12/21, Paul Moore wrote:
> > > > When changing the ebpf program put() routines to support being called
> > > > from within IRQ context the program ID was reset to zero prior to
> > > > generating the audit UNLOAD record, which obviously rendered the ID
> > > > field bogus (always zero).  This patch resolves this by adding a new
> > > > field, bpf_prog_aux::id_audit, which is set when the ebpf program is
> > > > allocated an ID and never reset, ensuring a valid ID field,
> > > > regardless of the state of the original ID field, bpf_prox_aud::id.
> > >
> > > > I also modified the bpf_audit_prog() logic used to associate the
> > > > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > > > Instead of keying off the operation, it now keys off the execution
> > > > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > > > appropriate and should help better connect the UNLOAD operations with
> > > > the associated audit state (other audit records).
> > >
> > > [..]
> > >
> > > > As an note to future bug hunters, I did briefly consider removing the
> > > > ID reset in bpf_prog_free_id(), as it would seem that once the
> > > > program is removed from the idr pool it can no longer be found by its
> > > > ID value, but commit ad8ad79f4f60 ("bpf: offload: free program id
> > > > when device disappears") seems to imply that it is beneficial to
> > > > reset the ID value.  Perhaps as a secondary indicator that the ebpf
> > > > program is unbound/orphaned.
> > >
> > > That seems like the way to go imho. Can we have some extra 'invalid_id'
> > > bitfield in the bpf_prog so we can set it in bpf_prog_free_id and
> > > check in bpf_prog_free_id (for this offloaded use-case)? Because
> > > having two ids and then keeping track about which one to use, depending
> > > on the context, seems more fragile?
> >
> > I would definitely prefer to keep just a single ID value, and that was
> > the first approach I took when drafting this patch, but when looking
> > through the git log it looked like there was some desire to reset the
> > ID to zero on free.  Not being an expert on the ebpf kernel code I
> > figured I would just write the patch up this way and make a comment
> > about not zero'ing out the ID in the commit description so we could
> > have a discussion about it.
> >
> > I'm not seeing any other comments, so I'll go ahead with putting
> > together a v2 that sets an invalid flag/bit and I'll post that for
> > further discussion/review.
>
> great, perf suffers the same issue:
>   https://lore.kernel.org/bpf/Y3SRWVoycV290S16@krava/
>
> any chance you could include it as well? I can send a patch
> later if needed

Hi Jiri,

I'm pretty sure the current approach recommended by Stanislav, to
never reset/zero the ID and instead mark it as invalid via a flag in
the bpf_prog struct, should resolve the perf problem as well.  My time
is a little short at the moment due to the holidays, but perhaps with
a little luck I'll get a new revision of the patch posted soon
(today?) and you can take a look and give it a test.  Are you
subscribed to the linux-audit and/or bpf mailing lists?  If not I can
CC you directly on the next revision.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

