Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 378B565D502
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YnxW0YT/bf2+B5bxo6Ee0HJC5hD8SDoTJBlWy/+Obyg=;
	b=Uizg4JKU/dCZjUaxaLdmgWfje3fejKe2jq1DJbDnimOXY4dWCihrfA/TOl/WGMAes6w47N
	dzRviQ8i8Gh1i/1FRTWOdmh0gEl+n8aoYun5ltrhbWmVF5W24jNOqfwFX52vgFI5Nl1wBk
	+fmEeak/acnUpi5A8ZGBvkXz29j2ijs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-FACRbFJUM46Pt_RLQPUntQ-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: FACRbFJUM46Pt_RLQPUntQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E95680D0EC;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D84F1121314;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB6EC194658C;
	Wed,  4 Jan 2023 14:07:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C74F1946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Dec 2022 04:19:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07B2C112132D; Fri, 30 Dec 2022 04:19:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 006CF112132C
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 04:19:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D600F8F6E80
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 04:19:01 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-328-Jz1vmzbqMDmaSvZsdXn-RA-1; Thu, 29 Dec 2022 23:18:59 -0500
X-MC-Unique: Jz1vmzbqMDmaSvZsdXn-RA-1
Received: by mail-ed1-f49.google.com with SMTP id u18so27714079eda.9
 for <linux-audit@redhat.com>; Thu, 29 Dec 2022 20:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LDRs4PLNOZi6E/lSAZ1su22s9pgjU7A0PvegEN5lh0=;
 b=fvrFm6g+zbR7nh0TCmtE01Y7xy+75uXlKCXsetd6MHqZs20evnDnusGi7AVF+5+lI8
 FHxW7oAcHLElb3n181XzQhqQrriIncfbZWgPF/x3YhpPioOVkuKwClWdj+RzUULMLTxL
 ZCF/SYqlMViEA6qP2Od5VpFSMDrUHEWHfsC/Sj+/zY5XY5awEl/j2wS+JvFZx6IGoe+l
 8V+mcJ6q9X2t+ld6EcgIKIO5ubQH70YI+jq8DFuSZz60NaNq1ovxzCZWOXh4S9dRIHfV
 b1C6qzSrwqVRgXeTq2ZwwhGysKWAc6PjPpp+y+W1i/l293U4D2BRwdB8crCV+Uyvp+pR
 b50w==
X-Gm-Message-State: AFqh2kq6ra9gQQk4ZbkzE3DlbZ/oyP8vCqpWaSXDTsugxFNB0D+LbroR
 CuRRXt50KVJpD1GVrR/CcZpe9w2QL9ysHKlUIGY=
X-Google-Smtp-Source: AMrXdXtbxD3Aujg79QuPh+xUGj42jdrm4/O9QSW2CkQVl5lyICwYNx414FNSXM9JH5jWFcqWXWMspQ7PDmby+x/zwKU=
X-Received: by 2002:aa7:d7c6:0:b0:486:9f80:8fbc with SMTP id
 e6-20020aa7d7c6000000b004869f808fbcmr1497251eds.421.1672373938065; Thu, 29
 Dec 2022 20:18:58 -0800 (PST)
MIME-Version: 1.0
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
 <20221227033528.1032724-1-stfomichev@yandex.ru>
 <1855474adf8.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <CAKH8qBvR3=sSGvgGB_CqCFZhKynxdgatCK7N0mBZs1gBPDvTWw@mail.gmail.com>
 <CAADnVQ+MRTYs9sbN4a1oAV7TJ2bqRS4QE9ShmofQ9M--KQducg@mail.gmail.com>
 <CAKH8qBsN+ypbKyE-oiTzmH06ML71TmN9zqEr4=6KvXwt8TE0QQ@mail.gmail.com>
In-Reply-To: <CAKH8qBsN+ypbKyE-oiTzmH06ML71TmN9zqEr4=6KvXwt8TE0QQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 29 Dec 2022 20:18:46 -0800
Message-ID: <CAADnVQ+JswT0KE_mwshO-igoP-LYLCOco61+FGP+opY4xES8Eg@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: Stanislav Fomichev <sdf@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:27 +0000
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Burn Alting <burn.alting@iinet.net.au>,
 Stanislav Fomichev <stfomichev@yandex.ru>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, linux-audit@redhat.com,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 29, 2022 at 7:38 PM Stanislav Fomichev <sdf@google.com> wrote:
>
> On Thu, Dec 29, 2022 at 7:10 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Dec 29, 2022 at 6:13 PM Stanislav Fomichev <sdf@google.com> wrote:
> > >
> > > On Tue, Dec 27, 2022 at 8:40 AM Paul Moore <paul@paul-moore.com> wrote:
> > > >
> > > > On December 26, 2022 10:35:49 PM Stanislav Fomichev <stfomichev@yandex.ru>
> > > > wrote:
> > > > >> On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> > > > >> get_func_ip() */
> > > > >>>> -                               tstamp_type_access:1; /* Accessed
> > > > >>>> __sk_buff->tstamp_type */
> > > > >>>> +                               tstamp_type_access:1, /* Accessed
> > > > >>>> __sk_buff->tstamp_type */
> > > > >>>> +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> > > > >>>>    enum bpf_prog_type      type;           /* Type of BPF program */
> > > > >>>>    enum bpf_attach_type    expected_attach_type; /* For some prog types */
> > > > >>>>    u32                     len;            /* Number of filter blocks */
> > > > >>>> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> > > > >>>> struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> > > > >>>> void bpf_prog_put(struct bpf_prog *prog);
> > > > >>>>
> > > > >>>> +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > > > >>>> +{
> > > > >>>> +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > > > >>>> +               return 0;
> > > > >>>> +       return prog->aux->__id;
> > > > >>>> +}
> > > > >>>
> > > > >>> I'm still missing why we need to have this WARN and have a check at all.
> > > > >>> IIUC, we're actually too eager in resetting the id to 0, and need to
> > > > >>> keep that stale id around at least for perf/audit.
> > > > >>> Why not have a flag only to protect against double-idr_remove
> > > > >>> bpf_prog_free_id and keep the rest as is?
> > > > >>> Which places are we concerned about that used to report id=0 but now
> > > > >>> would report stale id?
> > > > >>
> > > > >> What double-idr_remove are you concerned about?
> > > > >> bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> > > > >> while __bpf_prog_put just dropped it to zero.
> > > > >
> > > > > (traveling, sending from an untested setup, hope it reaches everyone)
> > > > >
> > > > > There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> > > > > tries to make offloaded program disappear from the idr when the netdev
> > > > > goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> > > > > is to handle that case where we do bpf_prog_free_id much earlier than the
> > > > > rest of the __bpf_prog_put stuff.
> > > > >
> > > > >> Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> > > > >> after perf_event_bpf_event and bpf_audit_prog ?
> > > > >> Probably can remove the obsolete do_idr_lock bool flag as
> > > > >> separate patch?
> > > > >
> > > > > +1 on removing do_idr_lock separately.
> > > > >
> > > > >> Much simpler fix and no code churn.
> > > > >> Both valid_id and saved_id approaches have flaws.
> > > > >
> > > > > Given the __bpf_prog_offload_destroy path above, we still probably need
> > > > > some flag to indicate that the id has been already removed from the idr?
> > > >
> > > > So what do you guys want in a patch?  Is there a consensus on what you
> > > > would merge to fix this bug/regression?
> > >
> > > Can we try the following?
> > >
> > > 1. Remove calls to bpf_prog_free_id (and bpf_map_free_id?) from
> > > kernel/bpf/offload.c; that should make it easier to reason about those
> > > '!id' checks
> >
> > calls? you mean a single call, right?
>
> Right, there is a single call to bpf_prog_free_id. But there is also
> another single call to bpf_map_free_id with the same "remove it from
> idr so it can't be found if GET_NEXT_ID" reasoning.

map offloading is different from prog offload.
Like:
        if (bpf_map_is_dev_bound(map))
                return bpf_map_offload_lookup_elem(map, key, value);

gotta be much more careful with them and offload.

> It's probably worth it to look into whether we can remove it as well
> to have consistent id management for progs and maps?

I'd rather not at this point.
Consistency sounds nice, but requires a ton more work.

> > > 2. Move bpf_prog_free_id (and bpf_map_free_id?) to happen after
> > > audit/perf in kernel/bpf/syscall.c (there are comments that say "must
> > > be called first", but I don't see why; seems like GET_FD_BY_ID would
> > > correctly return -ENOENT; maybe Martin can chime in, CC'ed him
> > > explicitly)
> >
> > The comment says that it should be removed from idr
> > before __bpf_prog_put_noref will proceed to clean up.
>
> Which one? I was trying to see if there is any reasoning in the
> original commit 34ad5580f8f9 ("bpf: Add BPF_(PROG|MAP)_GET_NEXT_ID
> command"), but couldn't find anything useful :-(

Maybe back then we didn't have atomic_inc_not_zero(prog/map->refcnt) ?
I don't really recall what race we were worried about.

> > > 3. (optionally) Remove do_idr_lock arguments (all callers are passing 'true')
> >
> > yes. please.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

