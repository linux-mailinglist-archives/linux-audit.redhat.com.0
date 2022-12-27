Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8614A656D07
	for <lists+linux-audit@lfdr.de>; Tue, 27 Dec 2022 17:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672159234;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7tzKczIe6Sn2AtOam5bWnCPXE1kmdVOORWuFhFvoT4M=;
	b=YXEwtp6AgqNQGPracuuzCuvmqYAXHmMR0eJLJ5jRsA9kSLiT+nV2kUxgn9QSIILa187IJn
	uM32b8fJNhWrn0JeZcNudcuqEw56bWTQgMgUUn8VsoA5W14v6HajudlkibTwPPlOB1edWD
	OAVRXFGj7H8CHEkP4ufcIfJCls+5n+o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-TAtrbf8oNI2aCIJCzXP7Cw-1; Tue, 27 Dec 2022 11:40:30 -0500
X-MC-Unique: TAtrbf8oNI2aCIJCzXP7Cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 232E8281DE67;
	Tue, 27 Dec 2022 16:40:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB3040C2004;
	Tue, 27 Dec 2022 16:40:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B15FE1946595;
	Tue, 27 Dec 2022 16:40:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5233B1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Dec 2022 16:40:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFB49140E949; Tue, 27 Dec 2022 16:40:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7F6D140EBF6
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 16:40:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBE1E882820
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 16:40:18 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-S9Y8hlNjPmqqKVOqXQB-wg-1; Tue, 27 Dec 2022 11:40:15 -0500
X-MC-Unique: S9Y8hlNjPmqqKVOqXQB-wg-1
Received: by mail-il1-f180.google.com with SMTP id o8so6978761ilo.1
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 08:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIce7nRh9xGN4UvjxO/SDv0vJFrrYRvHppVuS+QFVhE=;
 b=N3ZDKE0Q8z8li3SaS+YTr5giheF5Py9mZ4ilvb73RZp5IrwoZyPMenV55+LubNIkAc
 FzAZCdD+oW/XqtEeulFBTCdKKoRaSyQF6m/XCmAHuYdbE8osy3bJzjenTHDFIynMNPOk
 5GZxWvPTnqqh1T5Ir01StMHnZZQruVB0FKo/uAfmL1j2kZEZ3adDtl+4oI9lcYW2R5aX
 741I7rEF01Y3tuZ6DGgWuKaXDc/RUQ/PqryrH6JpD61mqbysYEpC+n1lGI5HgnpTflx3
 Ai8Mldwa0gxEZwysE8jq8hMo0bhUbcyzzx1K8X+jOOJpaWUlhPM+dwoyvv7+lDye6ikd
 RZLQ==
X-Gm-Message-State: AFqh2krweE314fYhSNompWy5+Wi588bMwFzYstzSk+kn5n3XwMa95B7e
 OrfPhgUv1DGASpvoWjVsHoxU
X-Google-Smtp-Source: AMrXdXvjs5MwFIzPRSKK0dJ0FJtURJU3NLvTA/UX1momTrK7JHfI4cMrdLQUVSDRERLGZnlgFHIvlw==
X-Received: by 2002:a92:7409:0:b0:307:7cf3:ca79 with SMTP id
 p9-20020a927409000000b003077cf3ca79mr15117006ilc.22.1672159215019; 
 Tue, 27 Dec 2022 08:40:15 -0800 (PST)
Received: from [10.187.149.138] (mobile-166-170-20-165.mycingular.net.
 [166.170.20.165]) by smtp.gmail.com with ESMTPSA id
 y23-20020a027317000000b00349c45fd3a8sm4375283jab.29.2022.12.27.08.40.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Dec 2022 08:40:14 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: Stanislav Fomichev <stfomichev@yandex.ru>, <alexei.starovoitov@gmail.com>
Date: Tue, 27 Dec 2022 11:40:11 -0500
Message-ID: <1855474adf8.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <20221227033528.1032724-1-stfomichev@yandex.ru>
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
 <20221227033528.1032724-1-stfomichev@yandex.ru>
User-Agent: AquaMail/1.41.0 (build: 104100234)
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
MIME-Version: 1.0
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
Cc: burn.alting@iinet.net.au, daniel@iogearbox.net, andrii@kernel.org,
 ast@kernel.org, linux-audit@redhat.com, sdf@google.com, jolsa@kernel.org,
 bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On December 26, 2022 10:35:49 PM Stanislav Fomichev <stfomichev@yandex.ru> 
wrote:
>> On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
>> get_func_ip() */
>>>> -                               tstamp_type_access:1; /* Accessed 
>>>> __sk_buff->tstamp_type */
>>>> +                               tstamp_type_access:1, /* Accessed 
>>>> __sk_buff->tstamp_type */
>>>> +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
>>>>    enum bpf_prog_type      type;           /* Type of BPF program */
>>>>    enum bpf_attach_type    expected_attach_type; /* For some prog types */
>>>>    u32                     len;            /* Number of filter blocks */
>>>> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
>>>> struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
>>>> void bpf_prog_put(struct bpf_prog *prog);
>>>>
>>>> +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
>>>> +{
>>>> +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
>>>> +               return 0;
>>>> +       return prog->aux->__id;
>>>> +}
>>>
>>> I'm still missing why we need to have this WARN and have a check at all.
>>> IIUC, we're actually too eager in resetting the id to 0, and need to
>>> keep that stale id around at least for perf/audit.
>>> Why not have a flag only to protect against double-idr_remove
>>> bpf_prog_free_id and keep the rest as is?
>>> Which places are we concerned about that used to report id=0 but now
>>> would report stale id?
>>
>> What double-idr_remove are you concerned about?
>> bpf_prog_by_id() is doing bpf_prog_inc_not_zero
>> while __bpf_prog_put just dropped it to zero.
>
> (traveling, sending from an untested setup, hope it reaches everyone)
>
> There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> tries to make offloaded program disappear from the idr when the netdev
> goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> is to handle that case where we do bpf_prog_free_id much earlier than the
> rest of the __bpf_prog_put stuff.
>
>> Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
>> after perf_event_bpf_event and bpf_audit_prog ?
>> Probably can remove the obsolete do_idr_lock bool flag as
>> separate patch?
>
> +1 on removing do_idr_lock separately.
>
>> Much simpler fix and no code churn.
>> Both valid_id and saved_id approaches have flaws.
>
> Given the __bpf_prog_offload_destroy path above, we still probably need
> some flag to indicate that the id has been already removed from the idr?

So what do you guys want in a patch?  Is there a consensus on what you 
would merge to fix this bug/regression?

--
paul-moore.com



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

