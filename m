Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D9606580
	for <lists+linux-audit@lfdr.de>; Thu, 20 Oct 2022 18:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666282447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ls2+kesqPXdr5wYBuZA+6rzUPZrBC1qRzW1HjWS3RZo=;
	b=CHq/eqTibllhsv9Ao/4hAjQlwkQGd/0nGkXW9PSsg72yUgNvYGMqa+GVcmAfJi02XCy/IK
	2VScLkyCsJiup5Ofs2PG5hC4PrH+rEbylE3TOTpoufKqd5CDIwRX3xBAmmXpawuxiLJvly
	uDNBVWprrbIscdzSrkY+lb7SHqAn3uI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-ItM4TzeVMXiFuOvyFFVP1A-1; Thu, 20 Oct 2022 12:14:05 -0400
X-MC-Unique: ItM4TzeVMXiFuOvyFFVP1A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 944C03C0F7E7;
	Thu, 20 Oct 2022 16:13:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18BB249BB60;
	Thu, 20 Oct 2022 16:13:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B0BE19465A4;
	Thu, 20 Oct 2022 16:13:51 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 868AE1946587 for <linux-audit@listman.corp.redhat.com>;
 Thu, 20 Oct 2022 16:13:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 77B9F1415138; Thu, 20 Oct 2022 16:13:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 701011415137
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 16:13:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B2491C004EC
 for <linux-audit@redhat.com>; Thu, 20 Oct 2022 16:13:49 +0000 (UTC)
Received: from sonic306-27.consmr.mail.ne1.yahoo.com
 (sonic306-27.consmr.mail.ne1.yahoo.com [66.163.189.89]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-426-GHre3bHAOs6GCSZPGAvY9Q-1; Thu,
 20 Oct 2022 12:13:39 -0400
X-MC-Unique: GHre3bHAOs6GCSZPGAvY9Q-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666282417; bh=rzVfJB5FqIz9yH3i3C4FFN/u38IJFEyk1iv3frnLvou=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=dJjjg2GF0utfe9m3fW4K7szGpT048GZGcr0oGelxlo9hhO9foqk8VCbzqI28kKEZWmbeJlMvt/5JqUIF9QP/sz4iMCxzvh9YYGVx4AmtF5och/XwGYc1WLi2W0iHNdPkdypwwmIjISouWexWOm13pk84dX8ZpD2uiPGMwpoA72SO2XMdL15FZKgMC52sfbBT4JlnBvj36FyELGi/KI/50DV7HyMC6IeaVoH+1l1YMC1mGO/L456ATPgX/A80jp67maYP3mKH05LTrklGX+8BoLVH1fBwHIMfTQI9hOM7DdSxDRQG+SBRxlW8+gTjRTXbbt7iAI8kjg6haOPoKZd0Ww==
X-YMail-OSG: 9M6vgrsVM1nOwPUtjF8DEhcOv8zHugxZwc4TQIZMJt.oo_bcVpQFI6z6XT13KpS
 QbAhFYNbGO9Uu3Gl1x8VnyWoFpmtjsYloRDa2mERcmgRo30MKIQvSBcVBrtyjfOv4uolRYRg4p64
 UY.bkVagQFn898x87V7xK06uTIDZQgk_axhZH38ogLpkcukgZt6DBRXfiiO9wa2pnEkjh1iic5yq
 n6_LL9kgkdCwYKUpPHL7eW1VnbXwaLob6gZ5NVIdvRVKsJ_8XpDLnQqIXdR2.uS6OLVXeWB5lPtL
 G1975Q4xdcRtVz1.XqnLrSjebFof1KBOxbvJb8ElXhfDV.v76mfYjKhynHRFOkOt83qfttG6WIbc
 PsrcYIUxTsrV2eRDu7GC3_woeF6zCyJXHvnXVE5XduPXE9q.qZ1CDvjwtspc6ZuxtKgTaSmDH3On
 5YJBv1l3mX.l2hLqTUyblvJt3mShR9A2i0hBP2fuuD_4u_zN.9qa_F30CUgc7qpwnQzez4Wv_rEx
 1pPq.qejNSICXsh0RgpvsV1Eqt6q_yTqYYYfpDP41YwDm2nv1FkHimHm88HgYZlkmtP0jaIZ0YmB
 DfdELE2XQUfU3LFrroEjbxZBMGF7yHCW6ke_iX.7k2tnc81GsKeJpfAjWVpij8s3qHKaYynDsKeC
 AoDSc8USDIFbGwdQXj8LCKU44vNXVs.PPrQPz6YYGxbQPtBYX42zhXJMC1PVCyZkhAOdS30_t8Wy
 _ouTxrCC9pxihVgKJr8d45z55NNftMUynZxhGyonwJNsZiLvaqTNy2d1mZq4MflIhLHLmBsRbUq0
 KQifyiPF.5PZz.Fw5juHhHJx.AArY56BEpvvUItEii0OIyxrsFFUfR6IDsaBVsjG4KQtO7XC.ckw
 BaPaV6ZCVHPxbLUMjpjUkeXuBbS6UDtwSgeiy2Xj_GLw6Qu33dfTeoisL_JKdJdHIakzeHUZy32L
 5X6Haf6oKyMOp.TZxuh7khcybvTRM0zuljocn22x7CXEO2DP1uVd3jdFqkRVOCvewY6VlYejCmcK
 btSWv4t.8bZjykNQLSaPX5Z1RZUinll1YHJ6xJC8M60qOjh.Nrvs9r3kZlXo7irP3RlHxlu9NS2.
 6DUTYyQYXeCY5Xxenk6nlV4ISBIjpjcmZENpjEM8DsyjuDTrUE225S35PNw6QK4z.MsTwM.5g6hd
 9IbiGEjbkyXoKrP4gIXCq2b2BBTPjp6_aqA7fv1ZQ2a.jwZ8yukb6_Dy_.J1K951XogT4TWKbvvW
 IGDw73Tkf8iLSxnsAqNVlFjl4eNrelJ8pcHnYU7VlYdiunbh0zAU4VP0lxuHaVoHvL_0UCjKEReS
 m2lPMzIOyrZAyed1XdHHPFUHKQII91rnnOXI7hlM8bMlwtZkb3WYBF6_BEisLKeFdmkiXGKwR5Ap
 LYlG2kydIyrkZqka7MwEJNxUvvwh8_cAaGvmYGSajiYKe3JwAoQ2skm7j1F51mjFVUHZJH1CX2RU
 KKmaU.HoMdAsfdXxPdgjyiEcLXGXiO33dMVBnTqJzEekKDptkeiuiq87xeOn6ZqQaBVn6tOCwYwt
 FkLhkDq_rUtdgNRJd14SfP7xifm3YRd59Qu.gS0YgVj1A8ljLQHg.cUeHPYc_AC.t9qLsnxLfmz4
 hq3R2U0BsNq2acgLrx9VUVc.71H2zt7kfJNdWSo7YDms1V5kCFAf5NTPjenN0nrjeQk3q2kWUV3k
 s6mzBdd6MpcHpYbdLksjcOjKdbm36zlW1ub8p9Dv2gmXvfwBtK.aQduqzq39sU9AEqMJhepuzEYQ
 3DQ8VCvhtF0M1AZpsU7ffDs1Zqmv1s2dKVSVsCoquYynHScoFjSK1PQR6Ueakzig.aAd2Iug8WCg
 okU0qAkMrL2bNR3QSMqnExCc8YQ7Idgw2Mz4ececyyUm8h5wsg45RayDFzAn_jwJEJe3wLifvzjw
 .jbVlpWCh1PCPC0XBK.KbROjpHtGD2JXEWt52e5mUM7FJ6hTyObOGJi_LZtR5bmuld0JPdbrxRBN
 G7HDbBhIXnzxDMyCHTvFHES4K7L1MCHJrBa8Qa.PVrSG2QGiEAs0QzpdBDKNDTiB9G3aF7DRkZ1b
 mXUa6QbGoN31L4k2YmjReIuGlJb8VWBf3LvciwiwP7Da5yi_Ytxp0RVfXdx60egJQUaxAIOsWPpv
 d8CINNhwBFF7hGIDShpw07HG5hKTft5mIIVzmBYV5jgdLa..KVCl7XpNgs.gloEg4pDDDqXmrC2G
 up1VOQb6pxUP2UUcOuoq74MQ5s__6p44mbs5KJhmFaSdjyy.RZ7tkLfIPB7vtiuWDlpJqxqvC9ET
 aat9MJWSclr45e026
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Thu, 20 Oct 2022 16:13:37 +0000
Received: by hermes--production-gq1-754cb59848-zdkt4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1f2e01732a1ec2c64f92c880c6263bd8; 
 Thu, 20 Oct 2022 16:13:34 +0000 (UTC)
Message-ID: <332a5987-8f4e-e26c-cfa5-5121cfa71ba9@schaufler-ca.com>
Date: Thu, 20 Oct 2022 09:13:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v38 06/39] LSM: lsm_self_attr syscall for LSM self
 attributes
To: Paul Moore <paul@paul-moore.com>
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-7-casey@schaufler-ca.com>
 <CAHC9VhQbr1zgyvzM9zB97+rzO-Rcy6CUt_3-54ED-SEanVWyRQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHC9VhQbr1zgyvzM9zB97+rzO-Rcy6CUt_3-54ED-SEanVWyRQ@mail.gmail.com>
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
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 casey.schaufler@intel.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/20/2022 8:44 AM, Paul Moore wrote:
> On Tue, Sep 27, 2022 at 3:57 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> Create a system call lsm_self_attr() to provide the security
>> module maintained attributes of the current process. Historically
>> these attributes have been exposed to user space via entries in
>> procfs under /proc/self/attr.
> Hi Casey,
>
> I had hoped to get to review these patches earlier this week, I know
> you are very anxious to see something happen here, but unfortunately
> that didn't work out and I'm now in a position of limited network
> access and time for a bit.  I will do my best to at least comment on
> the new syscall related additions, but thankfully you've already
> started to get some good comments from others so I'm hopeful that will
> help you keep moving forward.

Thanks. I just got back to work myself. Hopefully the comments will prove
useful. I'm just getting to them.

> One comment I did want to make, and it's important: please separate
> the LSM syscall patches from the LSM stacking patches.  While the
> stacking patches will obviously be dependent on the syscall patches,
> the syscall patches should not be dependent on stacking.  However, the
> LSM syscall patches must be designed from the start to support
> multiple, simultaneous LSMs.

OK. I will refactor into two patch sets. The first will be the syscalls
for getting the LSM attributes and the second will be the stacking changes.
The prctl() I proposed to set the "display" LSM will be in the second, as
it makes no sense to have without anything to change. I have not to date
included the SO_PEERCONTEXT that would be required for complete stacking.
Would you like to see that included in the syscall patches?


> Thanks.

Thank you.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

