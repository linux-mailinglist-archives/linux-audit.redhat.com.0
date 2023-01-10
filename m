Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3509D6646A7
	for <lists+linux-audit@lfdr.de>; Tue, 10 Jan 2023 17:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673369749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y63n9ErAoU66dBa4RwpkHgM+aHBMXTAPfHoeDW0Hji0=;
	b=DlJ9EB/qAt+LHIBrm6fuMZmSNbp7V0X/WodCIxt1kzn4EcV0Ri8OAipZRRKLn9A5iG7plt
	PWdL8OTE1fhuytFttMQ4pQ6jxtBkVjNhWXxii9vj0vdtsa8QFhOSFcc9EgDP2d5n8n62RS
	5s2nNmZMcPbnmzZ5eSUBplJrQmiBnCY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-PC44OnYfO222v6ZybO52yg-1; Tue, 10 Jan 2023 11:55:47 -0500
X-MC-Unique: PC44OnYfO222v6ZybO52yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 930763814948;
	Tue, 10 Jan 2023 16:55:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A372140EBF6;
	Tue, 10 Jan 2023 16:55:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B5A0194E120;
	Tue, 10 Jan 2023 16:55:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37A851946587 for <linux-audit@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 16:55:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16DBD140EBF6; Tue, 10 Jan 2023 16:55:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E87F140EBF4
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 16:55:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7DD2857F82
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 16:55:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-K8lpvly_PWi61syQPFeTzg-1; Tue, 10 Jan 2023 11:55:37 -0500
X-MC-Unique: K8lpvly_PWi61syQPFeTzg-1
Received: by mail-pl1-f181.google.com with SMTP id d15so13816773pls.6
 for <linux-audit@redhat.com>; Tue, 10 Jan 2023 08:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jR4tzWqElfmW8QXwRewDX/Da1DcZTjPzAW0JMNMjZzU=;
 b=5auTnViGMGpFGejBzRUwGL8cTlZxzex3ITsW3zG/CG+B40EmJ3j3KZdfzqwFFlP2jN
 RT07WhT3DyaLwO8KjuoeoL7dBDNne31o9qXvTQN5tJdFPSahYX1JMc+xq1/OX5PV3O9B
 ughCZleN/jGc6YcwSTMba9ccXwGzIhNi5xUylBeNDpFO98xoMg37s6AQExYfQ0xdpkvm
 EDyx9LH1r1IASEjbb7miVJK4dZpw4KRRH78eDT/5aWVr6mQtLmU8+6htvR9FC6Sdgjw7
 quikDaCn1y2IQGTR6O5i7JF+di37mStGISmNpQvp9BfbniTsf0Ws3TFDtv9CRBThLxsh
 GWNA==
X-Gm-Message-State: AFqh2kqOMKEXuxCzAk4pyB41GrJ2Ihbr190GZJF3PBoUg/Ws/77qe0T1
 PNf2uerp4yhsYrESN3XMHYDR+nb0FMuCbQ6kmenh
X-Google-Smtp-Source: AMrXdXtAcgCtqLeebZzIIOK+6EKQdCv8fBk3I302FBiBvlAmgf3r32qYRRPeFyzTWm/YpxvQUe5njrN/Ek4jAX5NeLI=
X-Received: by 2002:a17:902:968a:b0:192:7a00:c790 with SMTP id
 n10-20020a170902968a00b001927a00c790mr4310537plp.12.1673369735961; Tue, 10
 Jan 2023 08:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <Y70rbnusftLg1ymg@krava>
In-Reply-To: <Y70rbnusftLg1ymg@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Jan 2023 11:55:26 -0500
Message-ID: <CAHC9VhTc19PbdqOLjP-s_AiEO-z4POF1cCPF7MjjO8GvB8=DNw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
To: Jiri Olsa <olsajiri@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
 Burn Alting <burn.alting@iinet.net.au>, Stanislav Fomichev <sdf@google.com>,
 Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 10, 2023 at 4:10 AM Jiri Olsa <olsajiri@gmail.com> wrote:
> On Fri, Jan 06, 2023 at 10:43:59AM -0500, Paul Moore wrote:
> > When changing the ebpf program put() routines to support being called
> > from within IRQ context the program ID was reset to zero prior to
> > calling the perf event and audit UNLOAD record generators, which
> > resulted in problems as the ebpf program ID was bogus (always zero).
> > This patch addresses this problem by removing an unnecessary call to
> > bpf_prog_free_id() in __bpf_prog_offload_destroy() and adjusting
> > __bpf_prog_put() to only call bpf_prog_free_id() after audit and perf
> > have finished their bpf program unload tasks in
> > bpf_prog_put_deferred().  For the record, no one can determine, or
> > remember, why it was necessary to free the program ID, and remove it
> > from the IDR, prior to executing bpf_prog_put_deferred();
> > regardless, both Stanislav and Alexei agree that the approach in this
> > patch should be safe.
> >
> > It is worth noting that when moving the bpf_prog_free_id() call, the
> > do_idr_lock parameter was forced to true as the ebpf devs determined
> > this was the correct as the do_idr_lock should always be true.  The
> > do_idr_lock parameter will be removed in a follow-up patch, but it
> > was kept here to keep the patch small in an effort to ease any stable
> > backports.
> >
> > I also modified the bpf_audit_prog() logic used to associate the
> > AUDIT_BPF record with other associated records, e.g. @ctx != NULL.
> > Instead of keying off the operation, it now keys off the execution
> > context, e.g. '!in_irg && !irqs_disabled()', which is much more
> > appropriate and should help better connect the UNLOAD operations with
> > the associated audit state (other audit records).
> >
> > Cc: stable@vger.kernel.org
> > Fixes: d809e134be7a ("bpf: Prepare bpf_prog_put() to be called from irq context.")
> > Reported-by: Burn Alting <burn.alting@iinet.net.au>
> > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > Suggested-by: Stanislav Fomichev <sdf@google.com>
> > Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
> >
> > ---
> > * v3
> > - abandon most of the changes in v2
> > - move bpf_prog_free_id() after the audit/perf unload hooks
> > - remove bpf_prog_free_id() from __bpf_prog_offload_destroy()
> > - added stable tag
>
> fwiw I checked and the perf UNLOAD events have proper id now
> thanks for fixing this

No problem, thanks for verifying that this solves the perf problem too.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

