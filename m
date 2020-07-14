Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAFA21E47D
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 02:28:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-DEX-kPNNOmSh68BM-K6UfQ-1; Mon, 13 Jul 2020 20:28:51 -0400
X-MC-Unique: DEX-kPNNOmSh68BM-K6UfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC2F31080;
	Tue, 14 Jul 2020 00:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DB5D6FEF3;
	Tue, 14 Jul 2020 00:28:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF463180954D;
	Tue, 14 Jul 2020 00:28:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E0SWhk022812 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 20:28:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58FB62156A4A; Tue, 14 Jul 2020 00:28:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54AAF2156A4D
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:28:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA8411884987
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:28:27 +0000 (UTC)
Received: from sonic312-31.consmr.mail.ne1.yahoo.com
	(sonic312-31.consmr.mail.ne1.yahoo.com [66.163.191.212]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-352-nLJ2XR4mOKObTEnk8-FZ9w-1;
	Mon, 13 Jul 2020 20:28:25 -0400
X-MC-Unique: nLJ2XR4mOKObTEnk8-FZ9w-1
X-YMail-OSG: UK1WLuAVM1n1yL4diabUei5B31KYxayFb2NLvrMl14AtOgYIO0thiEv02OAcVKk
	jpO21ECJ_FSqxn9bCa6UsjkYnTqGBq439mFvXFXZ_U5PJe0XXYHwLcmOgFhfM_ZuB4S.YkcYTP_c
	KOJU5iyKvRvl5i5vsUqUm99p4rdfeWBVcLetpReUl3vc47g.Ei5o7L2B4Q9L45fFTUkC0JVSDhPh
	iD3_PBUYAZ26LZGDGyDzveCKWbiVjW3KyZN2sidySev3FIUoUOl5wnS6PkgoM6D5DObzggzbvvKA
	bgzBddYwkjgTs7N8kYY5ONhnSSeaggOVwDRSaaRdLzWz3Inpa6KOxjxOYf3AJ0afKyTyCbdKa.oJ
	BkMYRJo7stAdXs9IqLPnsQ0gHxgtVBp.fVfReF9RgUuJFDhE7nUvRr5Dz0BCksu7PocrHyShHpPZ
	tau4SQ.bAFhO_HAn41EI6s87jC9aD2J9qe0ryJV4LXdlP6xwjPVRA7O9pChBx6NFYb3OZzP0lJ7J
	y1Y56rCUhsgrsB2ZwS_ZS4yE_KXb8OgIKQ3mhDRLGJDeBQCH2rMfjYqD_71dyG7RgilFx8PTKoGz
	0kHr.4XH.MM7uUATyXdFQvG8VSBiYcFSdYAqBcJXEU5XrnNiLq0Fsgz.8jeW33bisGeH_alj4JNx
	C8anPvygsQJ4Keu3XwgyfCIRor4h1R5268FZp_DilMAV0.VmTcBsIKBr1HzxDFGl4VTIaF59Jfey
	DNNGxGIM9pR5ZcbcWTMv2EDfyb2CmdjvqUAUgwgDzYtQbHTceQ4xqzXi0R_ApUuSJjoXM_pRUhHs
	3ZeH1Qzo17VKou8H1s_2QpvNt7Qb_W.CfuraiNMjiZCGcdb43gNRxTApgADpYUstclR8QlYyf7PZ
	d0hHCAJq9UsKRlV9heM1eoyKLuvffBC6.hEav8g.ztlgep2zR3xT7BGo8Ud2nhlRjZjAon765PU8
	0MM6AlL70ce6LDVaI_C8m9Zf5Q.Ug62oblO6eqkNIpfHT93bVsJZynRD1fvnXzo2GTR4Q6Xiofck
	G5ykPncj8o006ZJQayXU2duQbahIi_WvwtGTC3iMsl2rvOxVkqHLFZ3kfDChvBwlEysGtbpg4oEn
	k.IIHmv15wNrGlHPgqHYZDAtYBCnQmH4.zjLDJf6azk_GcPucQkKngIr3W5QtaQl4M25CAPmWDGi
	8YvVhyTPRXX_Lq6g2t7h.ogjOeKIvWVIFung3Lu4nnLG1TX5tMen5wWV0BhsePWN_G2lxUi9HIgS
	trBE2Mwj8c2RHHDXDwaJlrUj492b3OKyJ2orYGqsW2ImPqWj7zlfGrRlWtJtHNYchs69GaamZuO5
	baraTysQRhpj96as_MQMbXI7gmL5EDCGXQzIVn_PtBsjrRiDpCBWu9wE7EZqDGffDOj8p3xR8VBx
	HDvm26F_rL9euPJmjVYKxRC5JcWCGyikz
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 14 Jul 2020 00:28:24 +0000
Received: by smtp413.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 693d59113318a62bd175c16cd678d79d; 
	Tue, 14 Jul 2020 00:28:22 +0000 (UTC)
Subject: Re: [PATCH ghak122 v1] audit: store event sockaddr in case of no rules
To: Paul Moore <paul@paul-moore.com>
References: <b62d4388b488dedfa2758f32e6d1e5414179b4f2.1593796497.git.rgb@redhat.com>
	<CAHC9VhReURKRe63t7mudKpkW0aVNpCmF=UWHSof1uvRkmZ8HTQ@mail.gmail.com>
	<20200713174014.mjsdugomgjtl3kgz@madcap2.tricolour.ca>
	<9ec00f40-e7e9-950e-4ed9-48533a9ee223@schaufler-ca.com>
	<20200713200214.qh3vnhcjozpnqf2l@madcap2.tricolour.ca>
	<e2a183b2-35f4-8493-c485-8bf86e5866e9@schaufler-ca.com>
	<CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <199a98fc-93ee-53fa-a5aa-4d79d26d1a91@schaufler-ca.com>
Date: Mon, 13 Jul 2020 17:28:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQUiqkeygtEWAa=j8Dxysh_jSWhf33CYo7i2Tij26FH2w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Eric Paris <eparis@parisplace.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/13/2020 5:11 PM, Paul Moore wrote:
> On Mon, Jul 13, 2020 at 7:09 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> ... but it does appear that I could switch to using your audit_alloc_local().
> In my opinion, linking the audit container ID and LSM stacking
> patchsets would seem like a very big mistake, especially since the
> consolidation you are describing could be done after the fact without
> any disruption to the kernel/userspace interface.  I would strongly
> encourage both patchsets to remain self-contained if at all possible
> so as to not jeopardize each other.

Whatever helps the review/ack process best works for me. I will leave
audit_stamp_context() as is unless there is other feedback that leads
it to be changed.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

