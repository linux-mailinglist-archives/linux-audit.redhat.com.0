Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 07D7B2533A7
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 17:27:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-LpGKcH-CPVKCxwP5s7VASA-1; Wed, 26 Aug 2020 11:27:19 -0400
X-MC-Unique: LpGKcH-CPVKCxwP5s7VASA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C2A510ABDC3;
	Wed, 26 Aug 2020 15:27:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E30BD5D9E8;
	Wed, 26 Aug 2020 15:27:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5E07181A869;
	Wed, 26 Aug 2020 15:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QFRBm0012532 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 11:27:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D885A1006170; Wed, 26 Aug 2020 15:27:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C80BD1006500
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:27:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684B58EE648
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 15:27:10 +0000 (UTC)
Received: from sonic310-30.consmr.mail.ne1.yahoo.com
	(sonic310-30.consmr.mail.ne1.yahoo.com [66.163.186.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-231-26cwXPPuMdeDG2C0o55Bzw-1;
	Wed, 26 Aug 2020 11:27:07 -0400
X-MC-Unique: 26cwXPPuMdeDG2C0o55Bzw-1
X-YMail-OSG: _pJE7_sVM1meXA56Bcfg0IRYuoeU8IJfqss204jAi6XC3SF_q191.SFiNAxrpXB
	Zzc.gA5rTCGN.jemSXx4gI.LSrqxJuIk_vjAfn5tmJPOyTkXZ5g.WQiSmlKhT4QStmxhntwy5ZJ0
	NWIRQZpjLfnvTU4m4qjYgDy35IXyPPqr.5TlSd86C2USJLBP7kUH857fC8E_C3hpha1SWXiCu8Kh
	x0byvjMXuJiD6t4Plr4CLXYWPa8_8FvGX7ChMvKRPZDoa3vz_i3eJsdRrCGi1n.zACrpHimqj1O5
	i3CHPQK6M2w2_KNPTASde9fblfshj1xPK0en9_XEuFo6H2ngi_UdlrgdcZpFvuVwZGhAxBdkfVcf
	hYTwv4VJkXH0jIKXiLenlVGImmI2dBY2mSCRk8WjIXX4QLtmK5QmVQyB8Ngzd0279cmqyTDBAhEX
	uajQdgoX4kqYMwxrPICgdV2wntoxB.GdboySV48.Crac5vNRJucJcNlbHK7a6zXJY39tAkPOC8sK
	f0h_sMmqdDf5dNkghNtJehwAxXdXzmH7_cxAoA2mOQIimoGmtT3zdMozEqWRskNAghoqF8y2WzA_
	I9ZyQTrfx_jZxKgQClHi1p353yh3QYIo5Knb1njt6bwhMUv5OLC9YW7Xewbjbg2SlC0V1DKxgccf
	PwlMyQUOdBFs0Kc4dk5j72ZYRfBsK_iOF9D01AmkHB9oTquCCk8JkYGMFjroexU1znnqjCVrt8K1
	qs52tkltqnaRpg0rqV2D6vqDWj_m8gG_GogRCUb2vtOy6pZEjkGCR3mimMT2jsD.vKPq6J2iiCae
	i2QtT2hItiFatGXBujwDYUJqQOpSpkUURPo2FLdBQUG0FwhuXXmLrB4k4s7jNPFToQnzukSNhe6k
	iBCRRp77atw8yjLy3lQPDRrYFVr_y2RhWII0_y4HN_sBQsZOO6rf8cESYN0zKH0r6.f2A8IHduIA
	KZqa4PZcq67Ix1unR0yit360dAC6cV2.x7HrW4r4gq4YSpKRbvxnVQlB8pwcXbaqfKRS2rFRHJqv
	vbR1M.ESsfk0m1z.1LL6DX7sxUmb1yZuHCXm0lKqEoYvcps114OMxQ11s1Pn50ANfWSGslelkDWJ
	byGU_I9QtmGNGrk4OXFVTj5ol1Ct0iGXV01PP6OJdtxel0.HGGjSyTXOUDhzdvokwC.dTaIITaX2
	PbsaAESUwCVQ5lY_dS.EABdVvGFeWoGVwZ8FrQ8.opszNqZenUb9sNZ75C8syaLMBFMftV1NqJFQ
	AIX6ovvFjCrEIvk8z4WnV7ocADyEWvcxp0QLJlTJ.OLU_Brj2C8X1gFnCVfG_km.yXsmIh1FXouT
	W1eQ7ROig4ltNHNC6PLuA_A4wHv1kKhussqWbWJI1IID9EVJ245zdLTXZyQO8pdkD9DZFRY8e4RT
	ipkRh5GQ58po.IUwViwy2FzNSBR3uKDp7ltsVc2JWEZMVH6K_ehp_Ys4qo731PW4QUjtDhrVgpKl
	o95aeNB2qdHE56de_Bj1tFIsUfvIqySPAfLHPjREhSg.PvtbCRwewFQN6NcapDKwXkxCXhL9jUaK
	7ZUSW7Hg6nJEtI7YbctwJtA--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic310.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 26 Aug 2020 15:27:06 +0000
Received: by smtp415.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID b5b563c2696ac3f378a8a1ac18efa795; 
	Wed, 26 Aug 2020 15:27:03 +0000 (UTC)
Subject: Re: [PATCH v20 00/23] LSM: Module stacking for AppArmor
To: casey.schaufler@intel.com, jmorris@namei.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
References: <20200826145247.10029-1-casey.ref@schaufler-ca.com>
	<20200826145247.10029-1-casey@schaufler-ca.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <a4c67f8e-66d4-2c35-0640-9a75fa15cc4c@schaufler-ca.com>
Date: Wed, 26 Aug 2020 08:27:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826145247.10029-1-casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-audit@redhat.com, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/26/2020 7:52 AM, Casey Schaufler wrote:
> This patchset provides the changes required for
> the AppArmor security module to stack safely with any other.
>
> v20: Rebase to 5.9-rc1
>      Change the BPF security module to use the lsmblob data. (patch 0002)
>      Repair length logic in subject label processing (patch 0015)
>      Handle -EINVAL from the empty BPF setprocattr hook (patch 0020)
>      Correct length processing in append_ctx() (patch 0022)
> ...
>
> https://github.com/cschaufler/lsm-stacking.git#stack-5.8-rc6-a-v19

https://github.com/cschaufler/lsm-stacking.git#stack-5.9-rc1-v20

Sorry about the old URL.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

